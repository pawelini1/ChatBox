//
//  ChatViewController.swift
//  ChatBox
//
//  Created by Pawel Szymanski on 10/07/2021.
//

import UIKit

protocol ChatViewLogic: AnyObject {
    func display(viewModels: [MessageViewModel])
    func display(message: String)
}

class ChatViewController: UIViewController {
    private let interactor: ChatBusinessLogic
    
    @IBOutlet private var messagesStackView: UIStackView!
    
    init(interactor: ChatBusinessLogic) {
        self.interactor = interactor
        super.init(nibName: "ChatViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        interactor.showInitialMessages()
    }
}

extension ChatViewController: ChatViewLogic {
    func display(message: String) {
        let alertController = UIAlertController(title: Localized.string(key: "error.message.title"),
                                                message: Localized.string(key: "error.message.message") + message,
                                                preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: Localized.string(key: "error.message.ok"), style: .default) { _ in })
        present(alertController, animated: true, completion: nil)
    }
    
    func display(viewModels: [MessageViewModel]) {
        messagesStackView.arrangedSubviews.forEach { messagesStackView.removeArrangedSubview($0) }
        viewModels.enumerated().forEach { model in
            let label = UILabel()
            label.text = model.element.date
            label.backgroundColor = model.offset % 2 == 0 ? .green : .systemPink
            messagesStackView.addArrangedSubview(label)
        }
    }
}
