//
//  Commands.swift
//  controller
//
//  Created by Matheus Gois on 04/11/21.
//

import Foundation

// Commands

struct Commands {

    // MARK: - Methods

    static func send(
        type: CommunicatorType = .request,
        payload: Payload? = .init(),
        uri: URI? = nil
    ) -> String? {
        Communicator(
            type: type,
            uri: uri,
            payload: payload
        ).json
    }
}

// MARK: - Toast

extension Commands {
    static func message(_ value: String) -> String? {
        send(
            payload: .init(message: value),
            uri: .toast
        )
    }
}
