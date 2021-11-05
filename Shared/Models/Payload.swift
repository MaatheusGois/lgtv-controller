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
    var id: String? = nil
    var forcePairing: Bool? = nil
    var pairingType: PairingType? = nil
    var manifest: Manifest? = nil
    var clientKey: String? = nil
    var message: String? = nil

    enum CodingKeys: String, CodingKey {
        case id
        case forcePairing
        case pairingType
        case manifest
        case clientKey = "client-key"
        case message
    }

    // Lifecycle

    init(
        id: String? = nil,
        forcePairing: Bool? = nil,
        pairingType: PairingType? = nil,
        manifest: Manifest? = nil,
        clientKey: String? = nil,
        message: String? = nil
    ) {
        self.id = id
        self.forcePairing = forcePairing
        self.pairingType = pairingType
        self.manifest = manifest
        self.clientKey = clientKey ?? DataStorage.clientKey
        self.message = message
    }
}
