//
//  XCUIElement+Extensions.swift
//  ChatBoxUITests
//
//  Created by Pawel Szymanski on 11/07/2021.
//

import XCTest

let defaultTimeout: TimeInterval = 20
let shortTimeout: TimeInterval = 5

extension XCUIElement {
    @discardableResult func waitForHittable(timeout: TimeInterval = shortTimeout) -> Bool {
        let predicate = NSPredicate(format: "hittable == 1")
        let expectation = XCTNSPredicateExpectation(predicate: predicate, object: self)
        return XCTWaiter().wait(for: [expectation], timeout: timeout) == .completed
    }
    
    @discardableResult func waitForEnabled(timeout: TimeInterval = shortTimeout) -> Bool {
        let predicate = NSPredicate(format: "enabled == 1")
        let expectation = XCTNSPredicateExpectation(predicate: predicate, object: self)
        return XCTWaiter().wait(for: [expectation], timeout: timeout) == .completed
    }
    
    @discardableResult func waitForExistence() -> Bool {
        waitForExistence(timeout: shortTimeout)
    }
    
    func clearText() {
        guard let currentText = value as? String else {
            XCTFail("Tried to clear and enter text into a non string value")
            return
        }
        typeText(String(repeating: XCUIKeyboardKey.delete.rawValue, count: currentText.count))
    }
    
    func enterText(text: String) {
        tap()
        clearText()
        typeText(text)
    }
}
