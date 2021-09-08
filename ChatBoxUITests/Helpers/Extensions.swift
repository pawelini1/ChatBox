//
//  Extensions.swift
//  ChatBoxUITests
//
//  Created by Pawel Szymanski on 08/09/2021.
//

import SwiftTestKit

extension Application {
    static var chatBox: Application { "com.szymanski.ChatBox" }
}

extension String {
    static var longText: String { "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec lacinia arcu sit amet quam ultricies, nec fermentum diam viverra." } 
    static var mediumText: String { "Lorem ipsum dolor sit amet, consectetur adipiscing elit." }
    static var shortText: String { "Lorem ipsum dolor." }
}
