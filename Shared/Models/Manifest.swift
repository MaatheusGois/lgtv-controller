//
//  Manifest.swift
//  controller
//
//  Created by Matheus Gois on 04/11/21.
//

import Foundation

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
