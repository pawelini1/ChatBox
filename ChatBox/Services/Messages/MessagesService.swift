//
//  MessagesService.swift
//  ChatBox
//
//  Created by Pawel Szymanski on 10/07/2021.
//

import Foundation

protocol MessagesService {
    func getMessages(completion: @escaping (Result<[Message], Error>) -> Void)
    func sendMessage(text: String, completion: @escaping (Result<Message, Error>) -> Void)
}
