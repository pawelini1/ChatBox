//
//  String+Lorem.swift
//  ChatBox
//
//  Created by Pawel Szymanski on 10/07/2021.
//

import Foundation

extension String {
    static var loremIpsum: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam placerat sollicitudin orci ac tempus. Nam tincidunt, est eget scelerisque bibendum, odio lectus fermentum enim, sit amet placerat ex tellus vel dolor. Maecenas sed justo felis. Donec vel velit tempor magna eleifend rutrum quis in dui. Integer tempus est eget nibh placerat, id pretium sem elementum. Aliquam erat volutpat. Quisque sed arcu diam. Etiam a nulla dictum, malesuada lacus vitae, auctor tortor. In sit amet mi lacinia, sollicitudin est nec, commodo nisl. Quisque maximus tempus eros a dapibus. Aliquam erat volutpat. Ut dapibus eros sed odio gravida, et fringilla magna sollicitudin. Vivamus vehicula tincidunt tortor, quis semper erat vehicula id. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Duis iaculis consectetur risus, tincidunt blandit tellus facilisis et. Morbi ac lectus nisi. Fusce porta eros at ornare tincidunt. Praesent feugiat neque in nisl ultrices, non tristique massa convallis. Duis pellentesque urna vitae enim vestibulum bibendum. Morbi porttitor dolor sit amet finibus gravida. Praesent ultrices at erat et vehicula."
    
    static func loremIpsum(wordsCount: Int) -> String {
        let words = loremIpsum.components(separatedBy: .whitespaces)
        return words[0..<(Swift.min(words.count, wordsCount))].joined(separator: " ")
    }
}
