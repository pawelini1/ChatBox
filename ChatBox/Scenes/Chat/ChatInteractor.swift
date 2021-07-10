//
//  ChatInteractor.swift
//  ChatBox
//
//  Created by Pawel Szymanski on 10/07/2021.
//

import Foundation

protocol ChatBusinessLogic {
    
}

class ChatInteractor {
    private let presenter: ChatPresentationLogic
    
    init(presenter: ChatPresentationLogic) {
        self.presenter = presenter
    }
}

extension ChatInteractor: ChatBusinessLogic {
    
}
