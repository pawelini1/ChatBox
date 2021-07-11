//
//  UINib+Extensions.swift
//  ChatBox
//
//  Created by Pawel Szymanski on 11/07/2021.
//

import UIKit

extension UINib {
    convenience init<T>(for class: T.Type) where T: UIView {
        self.init(nibName: String(describing: T.self), bundle: Bundle(for: T.self))
    }
    
    func build<T>(withOwner ownerOrNil: Any? = nil, options optionsOrNil: [OptionsKey: Any]? = nil) -> T where T: UIView {
        guard let view = instantiate(withOwner: ownerOrNil, options: optionsOrNil).first as? T else {
            fatalError("Cannot instantiate view of type \(T.self) using nib \(self)")
        }
        return view
    }
}
