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

// MARK: - Welcome

struct Communicator: JsonFomatter {
    var type: CommunicatorType?
    var id: String? = nil
    var payload: Payload?
    var error: String? = nil
    var uri: String? = nil

    static func message(_ value: String) -> Self {
        .init(
            type: .request,
            payload: .init(
                clientKey: CommonData.shared.clientKey,
                message: value
            ),
            uri: "ssap://system.notifications/createToast"
        )
    }

    static var turnOff: Self {
        .init(
            type: .request,
            uri: "ssap://system/turnOff"
        )
    }

    static var register: Self {
        .init(
            type: .register,
            payload: .init(
                id: "register_0",
                forcePairing: false,
                pairingType: .prompt,
                manifest: .init(
                    manifestVersion: 1,
                    appVersion: "1.1",
                    signed: .init(
                        created: "20140509",
                        appID: "com.lge.test",
                        vendorID: "com.lge",
                        localizedAppNames: .init(pt: "LG Remote App"),
                        localizedVendorNames: .init(pt: "LG Electronics"),
                        permissions: [
                            "TEST_SECURE",
                            "CONTROL_INPUT_TEXT",
                            "CONTROL_MOUSE_AND_KEYBOARD",
                            "READ_INSTALLED_APPS",
                            "READ_LGE_SDX",
                            "READ_NOTIFICATIONS",
                            "SEARCH",
                            "WRITE_SETTINGS",
                            "WRITE_NOTIFICATION_ALERT",
                            "CONTROL_POWER",
                            "READ_CURRENT_CHANNEL",
                            "READ_RUNNING_APPS",
                            "READ_UPDATE_INFO",
                            "UPDATE_FROM_REMOTE_APP",
                            "READ_LGE_TV_INPUT_EVENTS",
                            "READ_TV_CURRENT_TIME"
                        ],
                        serial: "2f930e2d2cfe083771f68e4fe7bb07"
                    ),
                    permissions: [
                        "LAUNCH",
                        "LAUNCH_WEBAPP",
                        "APP_TO_APP",
                        "CLOSE",
                        "TEST_OPEN",
                        "TEST_PROTECTED",
                        "CONTROL_AUDIO",
                        "CONTROL_DISPLAY",
                        "CONTROL_INPUT_JOYSTICK",
                        "CONTROL_INPUT_MEDIA_RECORDING",
                        "CONTROL_INPUT_MEDIA_PLAYBACK",
                        "CONTROL_INPUT_TV",
                        "CONTROL_POWER",
                        "READ_APP_STATUS",
                        "READ_CURRENT_CHANNEL",
                        "READ_INPUT_DEVICE_LIST",
                        "READ_NETWORK_STATE",
                        "READ_RUNNING_APPS",
                        "READ_TV_CHANNEL_LIST",
                        "WRITE_NOTIFICATION_TOAST",
                        "READ_POWER_STATE",
                        "READ_COUNTRY_INFO"
                    ],
                    signatures: [
                        .init(
                            signatureVersion: 1,
                            signature: "eyJhbGdvcml0aG0iOiJSU0EtU0hBMjU2Iiwia2V5SWQiOiJ0ZXN0LXNpZ25pbmctY2VydCIsInNpZ25hdHVyZVZlcnNpb24iOjF9.hrVRgjCwXVvE2OOSpDZ58hR+59aFNwYDyjQgKk3auukd7pcegmE2CzPCa0bJ0ZsRAcKkCTJrWo5iDzNhMBWRyaMOv5zWSrthlf7G128qvIlpMT0YNY+n/FaOHE73uLrS/g7swl3/qH/BGFG2Hu4RlL48eb3lLKqTt2xKHdCs6Cd4RMfJPYnzgvI4BNrFUKsjkcu+WD4OO2A27Pq1n50cMchmcaXadJhGrOqH5YmHdOCj5NSHzJYrsW0HPlpuAx/ECMeIZYDh6RMqaFM2DXzdKX9NmmyqzJ3o/0lkk/N97gfVRLW5hA29yeAwaCViZNCP8iC9aO0q9fQojoa7NQnAtw=="
                        )
                    ]
                ),
                clientKey: CommonData.shared.clientKey
            )
        )
    }
}

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
}

// MARK: - Manifest

struct Manifest: JsonFomatter {
    let manifestVersion: Int
    let appVersion: String
    let signed: Signed
    let permissions: [String]
    let signatures: [Signature]
}

// MARK: - Signature

struct Signature: JsonFomatter {
    let signatureVersion: Int
    let signature: String
}

// MARK: - Signed

struct Signed: JsonFomatter {
    let created, appID, vendorID: String
    let localizedAppNames: LocalizedAppNames
    let localizedVendorNames: LocalizedVendorNames
    let permissions: [String]
    let serial: String

    enum CodingKeys: String, CodingKey {
        case created
        case appID
        case vendorID
        case localizedAppNames, localizedVendorNames, permissions, serial
    }
}

// MARK: - LocalizedAppNames

struct LocalizedAppNames: JsonFomatter {
    let pt: String
}

// MARK: - LocalizedVendorNames

struct LocalizedVendorNames: JsonFomatter {
    let pt: String
}
