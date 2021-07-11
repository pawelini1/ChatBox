//
//  MessageView.swift
//  ChatBox
//
//  Created by Pawel Szymanski on 11/07/2021.
//

import UIKit

class MessageView: UIView {
    @IBOutlet private(set) var initialsLabel: UILabel!
    @IBOutlet private(set) var authorLabel: UILabel!
    @IBOutlet private(set) var timeLabel: UILabel!
    @IBOutlet private(set) var textLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        accessibilityIdentifier = AccessibilityIdentifiers.Chat.messageView
    }
}

extension MessageView {
    func apply(viewModel: MessageViewModel) {
        authorLabel.text = viewModel.author
        timeLabel.text = viewModel.date
        textLabel.text = viewModel.text
        initialsLabel.text = "\(viewModel.initials)"
        initialsLabel.backgroundColor = viewModel.initialsColor
    }
}
