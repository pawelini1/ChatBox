//
//  StaticMessagesService.swift
//  ChatBox
//
//  Created by Pawel Szymanski on 10/07/2021.
//

class StaticMessagesService {
    private var messages: [Message]
    
    init(messages: [Message]) {
        self.messages = messages
    }
}

extension StaticMessagesService: MessagesService {
    func getMessages(completion: @escaping (Result<[Message], Swift.Error>) -> Void) {
        completion(.success(messages))
    }
    
    func sendMessage(text: String, completion: @escaping (Result<Message, Swift.Error>) -> Void) {
        let message = Message(text: text, author: "Pawel")
        messages.append(message)
        completion(.success(message))
    }
}
