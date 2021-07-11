//
//  ChatInteractorTests.swift
//  ChatBoxTests
//
//  Created by Pawel Szymanski on 10/07/2021.
//

import XCTest
@testable import ChatBox

class ChatInteractorTests: XCTestCase {
    var service: MessagesServiceMock!
    var presenter: ChatPresenterMock!
    var tested: ChatInteractor!
    
    override func setUp() {
        super.setUp()
        self.presenter = ChatPresenterMock()
        self.service = MessagesServiceMock()
        self.tested = ChatInteractor(presenter: presenter, service: service)
    }
    
    func testServiceCalledWhenShowInitialMessages() throws {
        tested.showInitialMessages()
        XCTAssertTrue(service.getMessagesSpy.wasCalled)
    }
    
    func testPresentMessagesCalledWhenShowInitialMessagesAndServiceReturnsMessages() throws {
        service.getMessagesStub = { completion in completion(.success([Message.example1, Message.example2])) }
        
        tested.showInitialMessages()
        
        XCTAssertTrue(presenter.presentMessagesSpy.wasCalled)
        XCTAssertEqual(presenter.presentMessagesSpy.firstCall, [Message.example1, Message.example2])
    }
    
    func testPresentErrorCalledWhenShowInitialMessagesAndServiceReturnsError() throws {
        service.getMessagesStub = { completion in completion(.failure(TestError.dummyError)) }
        
        tested.showInitialMessages()
        
        XCTAssertTrue(presenter.presentErrorSpy.wasCalled)
        XCTAssertEqual(presenter.presentErrorSpy.firstCall as? TestError, TestError.dummyError)
    }
    
    func testServiceCalledWhenSendingNewMessage() throws {
        tested.sendMessage(text: "Example")
        XCTAssertTrue(service.sendMessageSpy.wasCalled)
        XCTAssertEqual(service.sendMessageSpy.firstCall?.0, "Example")
    }
    
    func testServiceCalledAndMessageTrimmedWhenSendingNewMessage() throws {
        tested.sendMessage(text: "  Example   \n\n   ")
        XCTAssertTrue(service.sendMessageSpy.wasCalled)
        XCTAssertEqual(service.sendMessageSpy.firstCall?.0, "Example")
    }
    
    func testServiceNotCalledWhenSendingNewMessageWithEmptyText() throws {
        tested.sendMessage(text: "")
        XCTAssertTrue(service.sendMessageSpy.wasNotCalled)
    }
    
    func testServiceNotCalledWhenSendingNewMessageWithOnlyWhitespaces() throws {
        tested.sendMessage(text: "   \t\n\n   ")
        XCTAssertTrue(service.sendMessageSpy.wasNotCalled)
    }
    
    func testPresenterCalledWhenSendingNewMessageAndServiceReturnsMessage() throws {
        let message = Message(identifer: "some-id", text: "Example", author: "Any", creationDate: Date())
        service.sendMessageStub = { text, completion in completion(.success(message)) }
        tested.sendMessage(text: "Example")
        XCTAssertTrue(presenter.presentNewMessageSpy.wasCalled)
        XCTAssertEqual(presenter.presentNewMessageSpy.firstCall, message)
    }
    
    func testPresenterCalledWhenSendingNewMessageAndServiceReturnsError() throws {
        service.sendMessageStub = { text, completion in completion(.failure(TestError.dummyError)) }
        tested.sendMessage(text: "Example")
        XCTAssertTrue(presenter.presentErrorSpy.wasCalled)
        XCTAssertEqual(presenter.presentErrorSpy.firstCall as? TestError, TestError.dummyError)
    }
}
