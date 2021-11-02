//
//  LogLevel.swift
//  controller
//
//  Created by Matheus Gois on 02/11/21.
//

import Foundation

enum Log {
    case prod
    case uat
}

struct Environment {

    private init() {}
    static var shared = Self()

    var log: Log = .uat
}
