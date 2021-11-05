//
//  CommonsData.swift
//  controller
//
//  Created by Matheus Gois on 04/11/21.
//

import Foundation

// Class

struct DataStorage {

    // Properties

    @UserDefaultAccess(key: "clientKey", defaultValue: nil)
    static var clientKey: String?
}
