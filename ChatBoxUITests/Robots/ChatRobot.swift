//
//  ChatRobot.swift
//  ChatBoxUITests
//
//  Created by Pawel Szymanski on 11/07/2021.
//

import XCTest

@discardableResult func chat(file: StaticString = #file, line: UInt = #line, closure: ((ChatRobot) -> Void)? = nil) -> ChatRobot {
    let robot = ChatRobot(file: file, line: line)
    closure?(robot)
    return robot
}

class ChatRobot {
    static var defaultQuery = XCUIApplication().otherElements.matching(identifier: AccessibilityIdentifiers.Chat.mainView)
    let chatQuery: XCUIElementQuery
    
    init(chatQuery: XCUIElementQuery = ChatRobot.defaultQuery, file: StaticString = #file, line: UInt = #line) {
        self.chatQuery = chatQuery
        XCTAssertTrue(chatQuery.element.waitForHittable(), "Footer does not exist", file: file, line: line)
    }
    
    func enterChatMessage(text: String, file: StaticString = #file, line: UInt = #line) {
        let inputTextView = chatQuery.textViews[AccessibilityIdentifiers.Chat.inputTextView]
        
        XCTAssertTrue(inputTextView.waitForHittable(), "Input TextView is not hittible")
        inputTextView.enterText(text: text)
    }
    
    func tapSendButton(file: StaticString = #file, line: UInt = #line) {
        let sendButton = chatQuery.buttons[AccessibilityIdentifiers.Chat.sendButton]
        
        XCTAssertTrue(sendButton.waitForHittable(), "Send button is not hittible")
        sendButton.tap()
    }
    
    func isMessageViewVisible(with text: String, file: StaticString = #file, line: UInt = #line) {
        let messageView = chatQuery.otherElements.matching(identifier: AccessibilityIdentifiers.Chat.messageView).staticTexts[text]

        XCTAssertTrue(messageView.waitForExistence(), "MessageView should exist, but it isn't", file: file, line: line)
    }
}
