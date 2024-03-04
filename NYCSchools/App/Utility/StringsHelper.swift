//
//  StringsHelper.swift
//  NYCSchools
//
//  Created by Диана Мишкова on 6.01.24.
//

import Foundation

extension String {
    func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
    
    func localized(params: CVarArg...) -> String {
        return String(format: localized(), params)
    }
}
