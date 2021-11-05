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
}

// MARK: - Communicator

struct Communicator: JsonFomatter {
    var type: CommunicatorType?
    var id: String? = nil
    var payload: Payload?
    var error: String? = nil
    var uri: URI? = nil
}
