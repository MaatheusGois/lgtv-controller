//
//  Log+Extensions.swift
//  controller
//
//  Created by Matheus Gois on 03/11/21.
//

import Foundation

func print(_ items: Any..., separator: String = " ", terminator: String = "\n") {
    guard Environment.shared.log == .uat else { return }
    Swift.print(items, separator: separator, terminator: terminator)
}
