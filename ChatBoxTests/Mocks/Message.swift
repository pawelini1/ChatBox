//
//  Message.swift
//  ChatBoxTests
//
//  Created by Pawel Szymanski on 11/07/2021.
//

import Foundation
@testable import ChatBox

extension Message: Equatable {
    static var example1 = Message(text: "example1 - text", author: "example1 - author", creationDate: Date())
    static var example2 = Message(text: "example2 - text", author: "example2 - author", creationDate: Date())

    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.identifer == rhs.identifer && lhs.author == rhs.author && lhs.text == rhs.text && lhs.creationDate == rhs.creationDate
    }
}
