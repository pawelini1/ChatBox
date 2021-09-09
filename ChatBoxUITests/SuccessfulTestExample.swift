//
//  SuccessfulTestExample.swift
//  ChatBoxUITests
//
//  Created by Pawel Szymanski on 10/07/2021.
//

import XCTest
import SwiftTestKit

class SuccessfulTestExample: XCTestCase {
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        try shell(
            .uninstall(application: .chatBox)
        )
        
        XCUIApplication().launch()
    }

    func testSendingNewLongMessage() throws {
        chat {
            $0.enterChatMessage(text: .longText)
            $0.tapSendButton()
            $0.isMessageViewVisible(with: .longText)
        }
    }
}
