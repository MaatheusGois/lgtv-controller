//
//  CommonsData.swift
//  controller
//
//  Created by Matheus Gois on 04/11/21.
//

import Foundation

// Class

final class CommonData {

    // Init
    private init() {}
    static let shared = CommonData()

    // Properties
    @UserDefaultAccess(key: "clientKey", defaultValue: nil)
    var clientKey: String?
}
