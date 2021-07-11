//
//  ChatPresenter.swift
//  ChatBox
//
//  Created by Pawel Szymanski on 10/07/2021.
//

protocol ChatPresentationLogic {
    func present(messages: [Message])
    func present(newMessage: Message)
    func present(error: Error)
}

class ChatPresenter {
    weak var view: ChatViewLogic?
}

extension ChatPresenter: ChatPresentationLogic {
    func present(messages: [Message]) {
        view?.display(messages: messages
                        .sorted { $0.creationDate < $1.creationDate }
                        .map { MessageViewModel(message: $0)})
    }
    
    func present(newMessage: Message) {
        view?.display(newMessage: MessageViewModel(message: newMessage))
    }
    
    func present(error: Error) {
        view?.display(errorMessage: error.localizedDescription)
    }
}
