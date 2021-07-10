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
    
    init(interactor: ChatBusinessLogic) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
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
        
    }
}
