//
//  Index+Extennsions.swift
//  controller
//
//  Created by Matheus Gois on 04/11/21.
//

import Foundation

extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
