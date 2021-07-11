//
//  MessagesServiceMock.swift
//  ChatBoxTests
//
//  Created by Pawel Szymanski on 11/07/2021.
//

import Foundation
@testable import ChatBox

class MessagesServiceMock: MessagesService {
    lazy var getMessagesSpy = spy(of: getMessages(completion:))
    lazy var getMessagesStub = softStub(of: getMessages(completion:))
    func getMessages(completion: @escaping (Result<[Message], Error>) -> Void) {
        getMessagesSpy.didCall(params: completion)
        getMessagesStub?(completion)
    }
    
    lazy var sendMessageSpy = spy(of: sendMessage(text:completion:))
    lazy var sendMessageStub = softStub(of: sendMessage(text:completion:))
    func sendMessage(text: String, completion: @escaping (Result<Message, Error>) -> Void) {
        sendMessageSpy.didCall(params: (text, completion))
        sendMessageStub?(text, completion)
    }
}
