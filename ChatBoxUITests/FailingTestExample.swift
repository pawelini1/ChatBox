//
//  FailingTestExample.swift
//  ChatBoxUITests
//
//  Created by Pawel Szymanski on 10/07/2021.
//

import XCTest
import SwiftTestKit

class FailingTestExample: XCTestCase {
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        try shell(
            .uninstall(application: .chatBox, fromSimulator: .current()),
            .set(appearance: .dark, inSimulator: .current())
        )
        recordVideo()
        
        XCUIApplication().launch()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        try shell(
            .set(appearance: .light, inSimulator: .current())
        )
    }

    func testSendingNewMessage() throws {
        chat {
            $0.enterChatMessage(text: .shortText)
            $0.tapSendButton()
            $0.isMessageViewVisible(with: .shortText.uppercased())
        }
    }
}
