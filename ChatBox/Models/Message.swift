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
}
