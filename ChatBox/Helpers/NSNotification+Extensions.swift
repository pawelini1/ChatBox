//
//  NSNotification+Extensions.swift
//  ChatBox
//
//  Created by Pawel Szymanski on 11/07/2021.
//

import Foundation
import UIKit

extension NSNotification {
    var keyboardEndFrame: CGRect? {
        (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
    }
    
    var keyboardAnimationDuration: TimeInterval? {
        (userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue
    }
}
