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
        let service = StaticMessagesService(messages: makeRandomMessages(count: 50))
        let interactor = ChatInteractor(presenter: presenter, service: service)
        let viewController = ChatViewController(interactor: interactor)
        presenter.view = viewController
        return viewController
    }
}

private extension ChatViewControllerFactory {
    func makeRandomMessages(count: UInt) -> [Message] {
        return (0..<count).map { (UInt) -> Message in
            Message(text: .loremIpsum(wordsCount: Int.random(in: 3...20)),
                    author: Int.random(in: 0...1) == 0 ? "Karen" : "Lisa",
                    creationDate: Date().addingTimeInterval(.day * Double.random(in: -10.0...0.0)))
        }
    }
}
