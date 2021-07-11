//
//  ChatPresenter.swift
//  ChatBox
//
//  Created by Pawel Szymanski on 10/07/2021.
//

import UIKit

protocol ChatPresentationLogic {
    func present(messages: [Message])
    func present(newMessage: Message)
    func present(error: Error)
}

class ChatPresenter {
    weak var view: ChatViewLogic?
    
    private let dateFormatter: DateFormatter
    private let colors: [UIColor]
    
    init(dateFormatter: DateFormatter = DefaultDateFormatter.dateShort,
         colors: [UIColor] = [.red, .blue, .green]) {
        self.dateFormatter = dateFormatter
        self.colors = colors
    }
}

extension ChatPresenter: ChatPresentationLogic {
    func present(messages: [Message]) {
        view?.display(messages: messages
                        .sorted { $0.creationDate < $1.creationDate }
                        .map { self.viewModel(for: $0) })
    }
    
    func present(newMessage: Message) {
        view?.display(newMessage: viewModel(for: newMessage))
    }
    
    func present(error: Error) {
        view?.display(errorMessage: error.localizedDescription)
    }
}

private extension ChatPresenter {
    func viewModel(for message: Message) -> MessageViewModel {
        let initials: Character = message.author.first.flatMap { $0 } ?? "?"
        let initialsColor: UIColor = initials.asciiValue.flatMap { self.colors[Int($0) % self.colors.count] } ?? .black
        return MessageViewModel(initials: initials,
                                initialsColor: initialsColor,
                                text: message.text,
                                author: message.author,
                                date: dateFormatter.string(from: message.creationDate))
    }
}
