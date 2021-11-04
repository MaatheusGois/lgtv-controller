//
//  JsonFomatter.swift
//  controller
//
//  Created by Matheus Gois on 03/11/21.
//

import Foundation

protocol JsonFomatter: Codable {}

extension JsonFomatter {
    var json: String? {
        guard
            let data = try? JSONEncoder().encode(self),
            let json = String(data: data, encoding: .utf8) else {
            return nil
        }
        return json
    }
}

extension String {
    func model<T: Codable>(type: T.Type) -> T? {
        guard let data = data(using: .utf8) else { return nil }
        return try? JSONDecoder().decode(type, from: data)
    }
}
