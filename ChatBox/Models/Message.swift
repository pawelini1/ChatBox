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
    
    init(identifer: String = UUID().uuidString,
         text: String,
         author: String,
         creationDate: Date = .init()) {
        self.identifer = identifer
        self.text = text
        self.author = author
        self.creationDate = creationDate
    }
    
    static func randomMessage() -> Message {
        let now = Date()
        return Message(text: .loremIpsum(wordsCount: Int.random(in: 3...20)),
                       author: Int.random(in: 0...1) == 0 ? "Karen" : "Lisa",
                       creationDate: now.addingTimeInterval(.day * Double.random(in: -10.0...0.0)))
    }
}
