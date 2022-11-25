//
//  InputValidator.swift
//  MyCreditManager
//
//  Created by Apple on 2022/11/25.
//

import Foundation

class InputValidator {
    private let pattern = "^[A-za-z0-9]{1,}$"
    private let initialInputPattern = "^[X1-5]$"
    
    func validateInput(input: String) -> Bool {
        return input.range(of: pattern, options: .regularExpression) != nil
    }
    
    func validateInitialInput(input: String) -> Bool {
        return input.range(of: initialInputPattern, options: .regularExpression) != nil
    }
}
