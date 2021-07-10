//
//  AppDelegate.swift
//  ChatBox
//
//  Created by Pawel Szymanski on 10/07/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    lazy var applicationJourney: ApplicationJourney = { makeApplicationJourney() }()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = applicationJourney.start()
        window.makeKeyAndVisible()
        self.window = window
        return true
    }
}

extension AppDelegate {
    func makeApplicationJourney() -> ApplicationJourney {
        // In general here we would put all journeys available in the application
        let chatJourney = ChatJourney(factory: ChatViewControllerFactory())
        return ApplicationJourney(chatJourney: chatJourney)
    }
}

    
