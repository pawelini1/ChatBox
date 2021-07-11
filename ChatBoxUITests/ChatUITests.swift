//
//  ChatUITests.swift
//  ChatBoxUITests
//
//  Created by Pawel Szymanski on 10/07/2021.
//

import XCTest

class ChatUITests: XCTestCase {
    override func setUp() {
        super.setUp()
        let app = XCUIApplication()
        app.launch()
    }

    func testSendingNewMessage() throws {
        chat {
            $0.enterChatMessage(text: "Some Test Message.")
            $0.tapSendButton()
            $0.isMessageViewVisible(with: "Some Test Message.")
        }
    }
}
