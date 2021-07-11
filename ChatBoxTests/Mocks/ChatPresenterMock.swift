//
//  ChatPresenterMock.swift
//  ChatBoxTests
//
//  Created by Pawel Szymanski on 11/07/2021.
//

import Foundation
@testable import ChatBox

class ChatPresenterMock: ChatPresentationLogic {
    lazy var presentMessagesSpy = spy(of: present(messages:))
    lazy var presentMessagesStub = softStub(of: present(messages:))
    func present(messages: [Message]) {
        presentMessagesSpy.didCall(params: messages)
        presentMessagesStub?(messages)
    }
    
    lazy var presentNewMessageSpy = spy(of: present(newMessage:))
    lazy var presentNewMessageStub = softStub(of: present(newMessage:))
    func present(newMessage: Message) {
        presentNewMessageSpy.didCall(params: newMessage)
        presentNewMessageStub?(newMessage)
    }
    
    lazy var presentErrorSpy = spy(of: present(error:))
    lazy var presentErrorStub = softStub(of: present(error:))
    func present(error: Error) {
        presentErrorSpy.didCall(params: error)
        presentErrorStub?(error)
    }
}
