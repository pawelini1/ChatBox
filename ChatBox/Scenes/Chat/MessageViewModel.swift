//
//  MessageViewModel.swift
//  ChatBox
//
//  Created by Pawel Szymanski on 10/07/2021.
//

import Foundation

struct MessageViewModel {
    let text: String
    let author: String
    let date: String
    
    init(message: Message, dateFormatter: DateFormatter = DefaultDateFormatter.dateShort) {
        self.init(text: message.text,
                  author: message.author,
                  date: dateFormatter.string(from: message.creationDate))
    }
    
    init(text: String, author: String, date: String) {
        self.text = text
        self.author = author
        self.date = date
    }
}
