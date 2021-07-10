//
//  StaticMessagesService.swift
//  ChatBox
//
//  Created by Pawel Szymanski on 10/07/2021.
//

class StaticMessagesService {
    enum Error: Swift.Error {
        case seriousError(String)
    }
    
    private let messages: [Message]
    
    init(messages: [Message]) {
        self.messages = messages
    }
}

extension StaticMessagesService: MessagesService {
    func getMessages(completion: @escaping (Result<[Message], Swift.Error>) -> Void) {
        completion(.success(messages))
    }
}
