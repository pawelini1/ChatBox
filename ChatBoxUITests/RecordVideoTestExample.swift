//
//  RecordVideoTestExample.swift
//  ChatBoxUITests
//
//  Created by Pawel Szymanski on 10/07/2021.
//

import XCTest
import SwiftTestKit

class RecordVideoTestExample: XCTestCase {
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        try shell(
            .uninstall(application: .chatBox)
        )
        
        XCUIApplication().launch()
    }

    func testSendingNewMessage() throws {
        chat {
            $0.enterChatMessage(text: .mediumText)
            $0.tapSendButton()
            $0.isMessageViewVisible(with: .mediumText)
        }
    }
}
