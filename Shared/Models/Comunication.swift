//
//  ComunicationnDataModel.swift
//  controller
//
//  Created by Matheus Gois on 03/11/21.
//

import Foundation

enum CommunicatorType: String, JsonFomatter {
    case register
    case error
    case registered
    case request
    case response
}

// MARK: - Communicator

struct Communicator: JsonFomatter {
    var type: CommunicatorType?
    var id: String?
    var uri: URI?
    var payload: Payload? = .init()
    var error: String?
}
