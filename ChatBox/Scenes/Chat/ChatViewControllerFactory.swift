//
//  ChatViewControllerFactory.swift
//  ChatBox
//
//  Created by Pawel Szymanski on 10/07/2021.
//

import UIKit

protocol ChatViewControllerFactoryProtocol {
    func makeViewController() -> UIViewController
}

class ChatViewControllerFactory {
    
}

extension ChatViewControllerFactory: ChatViewControllerFactoryProtocol {
    func makeViewController() -> UIViewController {
        let presenter = ChatPresenter()
        let randomMessages = (0..<50).map { (Int) -> Message in Message.randomMessage() }
        let service = StaticMessagesService(messages: randomMessages)
        let interactor = ChatInteractor(presenter: presenter, service: service)
        let viewController = ChatViewController(interactor: interactor)
        presenter.view = viewController
        return viewController
    }
}
