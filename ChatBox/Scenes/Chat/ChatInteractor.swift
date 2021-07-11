//
//  ChatInteractor.swift
//  ChatBox
//
//  Created by Pawel Szymanski on 10/07/2021.
//

import Foundation

protocol ChatBusinessLogic {
    func showInitialMessages()
    func sendMessage(text: String)
}

class ChatInteractor {
    private let presenter: ChatPresentationLogic
    private let service: MessagesService
    
    init(presenter: ChatPresentationLogic,
         service: MessagesService) {
        self.presenter = presenter
        self.service = service
    }
}

extension ChatInteractor: ChatBusinessLogic {
    func showInitialMessages() {
        service.getMessages { [weak self] result in
            guard let self = self else { return }
            result.onSuccess { self.presenter.present(messages: $0) }
            result.onFailure { self.presenter.present(error: $0)}
        }
    }
    
    func sendMessage(text: String) {
        guard !text.isEmpty else { return }
        service.sendMessage(text: text) { [weak self] result in
            guard let self = self else { return }
            result.onSuccess { self.presenter.present(newMessage: $0) }
            result.onFailure { self.presenter.present(error: $0)}
        }
    }
}
