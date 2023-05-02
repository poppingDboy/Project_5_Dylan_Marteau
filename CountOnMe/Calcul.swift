//
//  Calcul.swift
//  CountOnMe
//
//  Created by MARTEAU Dylan on 14/03/2023.
//  Copyright © 2023 Vincent Saluzzo. All rights reserved.
//

import Foundation

class Calcul {
    var result : String = ""
    
    var elements: [String] {
        return result.split(separator: " ").map { "\($0)" }
    }
    
    // Error check computed variables
    var expressionIsCorrect: Bool {
        return elements.last != "+" && elements.last != "-" && elements.last != "x" && elements.last != "/"
    }
    
    var expressionHaveEnoughElement: Bool {
        return elements.count >= 3
    }
    
    var canAddOperator: Bool {
        return elements.last != "+" && elements.last != "-" && elements.last != "x" && elements.last != "/"
    }
    
    var canAddDotOperand: Bool {
        return elements.last != "." && elements.last != "+" && elements.last != "-" && elements.last != "x" && elements.last != "/"
    }
    
    var canAddDot: Bool {
        return elements.last != "."
    }
    
    var canAddDotEmpty: Bool {
        return elements.last != ""
    }
    
    var expressionHaveResult: Bool {
        return result.firstIndex(of: "=") != nil
    }
    
    func equal() throws {
        // Create local copy of operations
        var operationsToReduce = elements
        
        // Iterate over operations while an operand still here
        while operationsToReduce.count > 1 {
            var result: Double
            var leftIndex: Int
            var rightIndex: Int
            
            guard expressionIsCorrect else { throw CalculError.expressionIsCorrect }
            
            var left: Double
            var right: Double
            
            let indexOfOperator : Int = {
                if let indexOfX = operationsToReduce.firstIndex(of: "x") {
                    return indexOfX
                } else if let indexOfX = operationsToReduce.firstIndex(of: "/") {
                    return indexOfX
                } else {
                    return 1
                }
            }()
            left = Double(operationsToReduce[indexOfOperator-1])!
            right = Double(operationsToReduce[indexOfOperator+1])!
            leftIndex = indexOfOperator-1
            rightIndex = indexOfOperator+1
            let operand = operationsToReduce[indexOfOperator]
            
            if right.isZero && operand == ("/"){
                throw CalculError.zeroError
            }
            
            switch operand {
            case "x": result = left * right
            case "/": result = left / right
            case "+": result = left + right
            case "-": result = left - right
            default: fatalError("Unknown operator !")
            }
            
            /// Look if the expression has 3 elements
            if expressionHaveEnoughElement {
                if doubleChecker(doubleToCheck: result) == true || result >= 2147483647.0 {
                    let range = leftIndex...rightIndex
                    operationsToReduce.removeSubrange(range)
                    operationsToReduce.insert("\(roundNumber(numberToRound: Double(result)))", at: leftIndex)
                } else {
                    let range = leftIndex...rightIndex
                    operationsToReduce.removeSubrange(range)
                    operationsToReduce.insert("\(Int(result))", at: leftIndex)
                }
            }
            else {
                throw CalculError.expressionHaveEnoughElement
            }
        }
        result.append(" = ")
        if expressionHaveResult {
            result.append("\(operationsToReduce.first!)")
        }
    }
    
    func addInteger(number: String) throws {
        if result.contains("=") {
            try reset()
        }
        if elements.last != "." && elements.last != "+" && elements.last != "-" && elements.last != "x" && elements.last != "/" {
            result.append(number)
        } else {
            result.append(" " + "\(number)")
        }
    }
    
    func addOperator(symbol: String) throws {
        if result.contains("=") {
            try reset()
        }
        if result.isEmpty {
            throw CalculError.operandError
        }
        
        guard canAddOperator else { throw CalculError.operandError }
        result.append(" " + "\(symbol)")
    }
    
    /// Convert to the thousandth
    func roundNumber(numberToRound: Double) -> Double {
        return round(1000 * numberToRound) / 1000
    }
    
    /// Allows the addition of a comma
    func addDot() throws {
        guard canAddDotOperand else { throw CalculError.dotOperandError }
        guard canAddDot else { throw CalculError.dotError }
        guard canAddDotEmpty else { throw CalculError.dotErrorEmpty }
        
        result.append(".")
    }
    
    /// It is a checker that allows to convert into the right type ( Int or Double )
    func doubleChecker(doubleToCheck: Double) -> Bool {
        let doubleChecked = roundNumber(numberToRound: doubleToCheck)
        
        let testDouble: Bool
        let nb = Int(doubleToCheck)
        let firstNumberRange: Double = Double(nb) + 0.001
        let lastNumberRange: Double = Double(nb) + 0.999
        
        if doubleChecked > firstNumberRange && doubleChecked < lastNumberRange {
            testDouble = true
            return testDouble
        } else {
            testDouble = false
            return testDouble
        }
    }
    
    /// Delete elements
    func reset() throws {
        result = ""
    }
}

/// ajouter le test integer et operand
/// pdf
/// 
