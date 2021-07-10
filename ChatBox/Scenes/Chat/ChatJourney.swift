//
//  ChatJourney.swift
//  ChatBox
//
//  Created by Pawel Szymanski on 10/07/2021.
//

import UIKit

class ChatJourney {
    private let factory: ChatViewControllerFactoryProtocol
    
    init(factory: ChatViewControllerFactoryProtocol) {
        self.factory = factory
    }
    
    func start() -> UIViewController {
        return factory.makeViewController()
    }
}
