//
//  Payload.swift
//  controller
//
//  Created by Matheus Gois on 04/11/21.
//

import Foundation

// MARK: - Payload

enum PairingType: String, JsonFomatter {
    case prompt = "PROMPT"
}

struct Payload: JsonFomatter {
    var forcePairing: Bool?
    var pairingType: PairingType?
    var clientKey: String?
    var message: String?
    var name: String?
    var socketPath: String?

    enum CodingKeys: String, CodingKey {
        case forcePairing
        case pairingType
        case clientKey = "client-key"
        case message
        case name
        case socketPath
    }

    // Lifecycle

    init(
        forcePairing: Bool? = nil,
        pairingType: PairingType? = nil,
        clientKey: String? = nil,
        message: String? = nil,
        name: String? = nil
    ) {
        self.forcePairing = forcePairing
        self.pairingType = pairingType
        self.clientKey = clientKey ?? DataStorage.clientKey
        self.message = message
        self.name = name
    }
}
