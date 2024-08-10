//
//  LogLevel.swift
//  controller
//
//  Created by Matheus Gois on 02/11/21.
//

import SwiftUI

enum Log {
    case prod
    case uat
}

class Environment: ObservableObject {

    private init() {}
    static var shared = Environment()

    @Published var log: Log = .uat

    @AppStorage("ip") var ip: String = ""
}
