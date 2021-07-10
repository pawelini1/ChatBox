//
//  DefaultDateFormatter.swift
//  ChatBox
//
//  Created by Pawel Szymanski on 10/07/2021.
//

import Foundation

class DefaultDateFormatter {
    static var dateShort: DateFormatter = {
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM d, HH:mm"
        return dateFormatterPrint
    }()
}
