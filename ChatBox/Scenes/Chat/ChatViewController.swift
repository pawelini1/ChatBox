//
//  ChatViewController.swift
//  ChatBox
//
//  Created by Pawel Szymanski on 10/07/2021.
//

import UIKit

protocol ChatViewLogic: AnyObject {
    
}

class ChatViewController: UIViewController {
    private let interactor: ChatBusinessLogic
    
    init(interactor: ChatBusinessLogic) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}

extension ChatViewController: ChatViewLogic {
    
}
