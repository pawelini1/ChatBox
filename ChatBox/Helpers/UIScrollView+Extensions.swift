//
//  UIScrollView+Extensions.swift
//  ChatBox
//
//  Created by Pawel Szymanski on 11/07/2021.
//

import UIKit

extension UIScrollView {
    func scrollToBottom(animated: Bool) {
        let offset = self.contentSize.height - self.visibleSize.height
        if offset > self.contentOffset.y {
            self.setContentOffset(CGPoint(x: 0, y: offset), animated: animated)
        }
    }
}
