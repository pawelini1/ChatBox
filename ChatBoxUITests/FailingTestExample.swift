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
            .startRecordingVideo(),
            .uninstall(application: .chatBox),
            .set(appearance: .dark)
        )
        
        XCUIApplication().launch()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        try shell(
            .stopRecordingVideo(completion: addVideoAttachment),
            .set(appearance: .light)
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
