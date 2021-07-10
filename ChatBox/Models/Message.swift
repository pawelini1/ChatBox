//
//  Message.swift
//  ChatBox
//
//  Created by Pawel Szymanski on 10/07/2021.
//

import Foundation

struct Message: Codable {
    let identifer: String
    let text: String
    let author: String
    let creationDate: Date
    
    static func randomMessage() -> Message {
        let now = Date()
        return Message(identifer: UUID().uuidString,
                       text: .loremIpsum,
                       author: Int.random(in: 0...1) == 0 ? "Mary" : "John",
                       creationDate: now.addingTimeInterval(.day * Double.random(in: 0.0...1.0)))
    }
}
