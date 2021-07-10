//
//  Localized.swift
//  ChatBox
//
//  Created by Pawel Szymanski on 10/07/2021.
//

import Foundation

class Localized {
    static func string(key: String, comment: String = "", bundle: Bundle = Bundle(for: Localized.self)) -> String {
        return NSLocalizedString(key, bundle: bundle, comment: comment)
    }
}
