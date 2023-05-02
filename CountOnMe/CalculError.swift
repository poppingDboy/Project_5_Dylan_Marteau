//
//  CalculError.swift
//  CountOnMe
//
//  Created by MARTEAU Dylan on 03/04/2023.
//  Copyright © 2023 Vincent Saluzzo. All rights reserved.
//

import Foundation

enum CalculError: Error {
    case operandError
    case resultError
    case zeroError
    case expressionIsCorrect
    case expressionHaveEnoughElement
    case dotError
    case integerError
    case dotOperandError
    case equalError
    case dotErrorEmpty
    case eraseError
}
