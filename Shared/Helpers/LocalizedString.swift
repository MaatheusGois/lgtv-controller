//
//  LocalizedString.swift
//  controller
//
//  Created by Matheus Gois on 04/11/21.
//

import Foundation

extension String {
    func localized(_ arguments: CVarArg...) -> String {
        return .init(format: localized, arguments: arguments)
    }

    var localized: String{
        return Bundle.main.localizedString(
            forKey: self,
            value: nil,
            table: "LocalizedString"
        )
    }
}
