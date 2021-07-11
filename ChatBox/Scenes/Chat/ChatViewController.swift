//
//  ChatViewController.swift
//  ChatBox
//
//  Created by Pawel Szymanski on 10/07/2021.
//

import UIKit

protocol ChatViewLogic: AnyObject {
    func display(messages: [MessageViewModel])
    func display(newMessage: MessageViewModel)
    func display(errorMessage: String)
}

class ChatViewController: UIViewController {
    private let interactor: ChatBusinessLogic
    
    @IBOutlet private var messagesStackView: UIStackView!
    @IBOutlet private var messagesScrolView: UIScrollView!
    @IBOutlet private var textView: UITextView!
    @IBOutlet private var bottomSpacing: NSLayoutConstraint!

    init(interactor: ChatBusinessLogic) {
        self.interactor = interactor
        super.init(nibName: "ChatViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        registerForKeyboardNotifications()
        interactor.showInitialMessages()
    }
    
    @IBAction func postButtonTapped() {
        interactor.sendMessage(text: textView.text)
    }
}

extension ChatViewController: ChatViewLogic {
    func display(errorMessage: String) {
        let alertController = UIAlertController(title: Localized.string(key: "error.message.title"),
                                                message: Localized.string(key: "error.message.message") + errorMessage,
                                                preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: Localized.string(key: "error.message.ok"), style: .default) { _ in })
        present(alertController, animated: true, completion: nil)
    }
    
    func display(messages viewModels: [MessageViewModel]) {
        messagesStackView.arrangedSubviews.forEach { messagesStackView.removeArrangedSubview($0) }
        viewModels.forEach { viewModel in
            self.appendNewMessage(viewModel)
        }
        scrollToBottom(animated: false)
    }
    
    func display(newMessage viewModel: MessageViewModel) {
        appendNewMessage(viewModel)
        scrollToBottom()
        UIView.animate(withDuration: .quickAnimation) {
            self.clearInput()
            self.view.layoutIfNeeded()
        }
    }
}

private extension ChatViewController {
    func appendNewMessage(_ viewModel: MessageViewModel) {
        let label = UILabel()
        label.text = viewModel.text
        label.numberOfLines = 0
        label.layer.borderWidth = 2.0
        label.layer.borderColor = UIColor.black.cgColor
        messagesStackView.addArrangedSubview(label)
    }
    
    func scrollToBottom(animated: Bool = true) {
        messagesScrolView.layoutIfNeeded()
        messagesScrolView.scrollToBottom(animated: animated)
    }
    
    func clearInput() {
        textView.text = nil
    }
}

private extension ChatViewController {
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let keyboardSize = notification.keyboardEndFrame else { return }
        UIView.animate(withDuration: notification.keyboardAnimationDuration ?? .quickAnimation) {
            self.bottomSpacing.constant = keyboardSize.height
            self.view.layoutIfNeeded()
            self.scrollToBottom(animated: false)
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        UIView.animate(withDuration: notification.keyboardAnimationDuration ?? .quickAnimation) {
            self.bottomSpacing.constant = 0.0
            self.view.layoutIfNeeded()
        }
    }
}
