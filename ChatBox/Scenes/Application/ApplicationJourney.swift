//
//  ApplicationJourney.swift
//  ChatBox
//
//  Created by Pawel Szymanski on 10/07/2021.
//

import UIKit

class ApplicationJourney {
    private let chatJourney: ChatJourney
    
    init(chatJourney: ChatJourney) {
        self.chatJourney = chatJourney
    }
    
    func start() -> UIViewController {
        return chatJourney.start()
    }
}
