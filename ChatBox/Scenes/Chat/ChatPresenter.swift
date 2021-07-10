//
//  ChatPresenter.swift
//  ChatBox
//
//  Created by Pawel Szymanski on 10/07/2021.
//

protocol ChatPresentationLogic {
    func present(messages: [Message])
    func present(error: Error)
}

class ChatPresenter {
    weak var view: ChatViewLogic?
}

extension ChatPresenter: ChatPresentationLogic {
    func present(messages: [Message]) {
        
        view?.display(viewModels: messages
                        .sorted { $0.creationDate > $1.creationDate }
                        .map { MessageViewModel(message: $0)})
    }
    
    func present(error: Error) {
        view?.display(message: error.localizedDescription)
    }
}
