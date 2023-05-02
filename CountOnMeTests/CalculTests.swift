//
//  SimpleCalcTests.swift
//  SimpleCalcTests
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import XCTest
@testable import CountOnMe

class CalculTests: XCTestCase {
    var calc : Calcul!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.calc = Calcul()
    }
    
    func testGivenSimpleOperation_WhenIncrementing_ThenResultShouldBeCorrect() {
        do {
            try calc.addInteger(number: "1")
        } catch CalculError.integerError {
            XCTFail("Integer Fail")
        } catch {
            XCTFail("Default Error")
        }
        do {
            try calc.addOperator(symbol: "+")
        } catch CalculError.operandError {
            XCTFail("Operand Fail")
        } catch {
            XCTFail("Default Error")
        }
        do {
            try calc.addInteger(number: "1")
        } catch CalculError.integerError {
            XCTFail("Integer Fail")
        } catch {
            XCTFail("Default Error")
        }
        do {
            try calc.equal()
        } catch CalculError.equalError {
            XCTFail("Equal Fail")
        } catch {
            XCTFail("Default Error")
        }
        XCTAssertEqual(calc.result, "1 + 1 = 2")
    }
    
    func testGivenSimpleOperationWithDoubles_WhenDividing_ThenResultShouldBeCorrect() {
        do {
            try calc.addInteger(number: "9")
            try calc.addInteger(number: "0")
            try calc.addInteger(number: "0")
            try calc.addInteger(number: "3")
            try calc.addInteger(number: "4")
            try calc.addInteger(number: "9")
        } catch CalculError.integerError {
            XCTFail("Integer Fail")
        } catch {
            XCTFail("Default Error")
        }
        do {
            try calc.addOperator(symbol: "/")
        } catch CalculError.operandError {
            XCTFail("Operand Fail")
        } catch {
            XCTFail("Default Error")
        }
        do {
            try calc.addInteger(number: "9")
            try calc.addInteger(number: "0")
            try calc.addInteger(number: "0")
            try calc.addInteger(number: "8")
            try calc.addInteger(number: "0")
        } catch CalculError.integerError {
            XCTFail("Integer Fail")
        } catch {
            XCTFail("Default Error")
        }
        do {
            try calc.equal()
        } catch CalculError.equalError {
            XCTFail("Equal Fail")
        } catch {
            XCTFail("Default Error")
        }
        XCTAssertEqual(calc.result, "900349 / 90080 = 9.995")
    }
    
    func testGivenSimpleOperation_WhenSubtracting_ThenResultShouldBeCorrect() {
        do {
            try calc.addInteger(number: "4")
        } catch CalculError.integerError {
            XCTFail("Integer Fail")
        } catch {
            XCTFail("Default Error")
        }
        do {
            try calc.addOperator(symbol: "-")
        } catch CalculError.operandError {
            XCTFail("Operand Fail")
        } catch {
            XCTFail("Default Error")
        }
        do {
            try calc.addInteger(number: "2")
        } catch CalculError.integerError {
            XCTFail("Integer Fail")
        } catch {
            XCTFail("Default Error")
        }
        do {
            try calc.equal()
        } catch CalculError.equalError {
            XCTFail("Equal Fail")
        } catch {
            XCTFail("Default Error")
        }
        XCTAssertEqual(calc.result, "4 - 2 = 2")
    }
    
    func testGivenSimpleOperation_WhenMultiplying_ThenResultShouldBeCorrect() {
        do {
            try calc.addInteger(number: "2")
        } catch CalculError.integerError {
            XCTFail("Integer Fail")
        } catch {
            XCTFail("Default Error")
        }
        do {
            try calc.addOperator(symbol: "x")
        } catch CalculError.operandError {
            XCTFail("Operand Fail")
        } catch {
            XCTFail("Default Error")
        }
        do {
            try calc.addInteger(number: "2")
        } catch CalculError.integerError {
            XCTFail("Integer Fail")
        } catch {
            XCTFail("Default Error")
        }
        do {
            try calc.equal()
        } catch CalculError.equalError {
            XCTFail("Equal Fail")
        } catch {
            XCTFail("Default Error")
        }
        XCTAssertEqual(calc.result, "2 x 2 = 4")
    }
    
    func testGivenSimpleOperation_WhenDividing_ThenResultShouldBeCorrect() {
        do {
            try calc.addInteger(number: "4")
        } catch CalculError.integerError {
            XCTFail("Integer Fail")
        } catch {
            XCTFail("Default Error")
        }
        do {
            try calc.addOperator(symbol: "/")
        } catch CalculError.operandError {
            XCTFail("Operand Fail")
        } catch {
            XCTFail("Default Error")
        }
        do {
            try calc.addInteger(number: "2")
        } catch CalculError.integerError {
            XCTFail("Integer Fail")
        } catch {
            XCTFail("Default Error")
        }
        do {
            try calc.equal()
        } catch CalculError.equalError {
            XCTFail("Equal Fail")
        } catch {
            XCTFail("Default Error")
        }
        XCTAssertEqual(calc.result, "4 / 2 = 2")
    }
    
    func testGivenAnIncorrectOperation_WhenAddingMinus_ThenResultShouldBeAnError() {
        do {
            try calc.addInteger(number: "1")
        } catch CalculError.integerError {
            XCTFail("Integer Fail")
        } catch {
            XCTFail("Default Error")
        }
        do {
            try calc.addOperator(symbol: "-")
            try calc.addOperator(symbol: "-")
        }  catch CalculError.operandError {
            XCTAssert(true)
        } catch {
            XCTFail("Default Error")
        }
    }
    
    func testGivenAnIncorrectOperation_WhenAddingPlus_ThenResultShouldBeAnError() {
        do {
            try calc.addInteger(number: "1")
        } catch CalculError.integerError {
            XCTFail("Integer Fail")
        } catch {
            XCTFail("Default Error")
        }
        do {
            try calc.addOperator(symbol: "+")
            try calc.addOperator(symbol: "+")
        }  catch CalculError.operandError {
            XCTAssert(true)
        } catch {
            XCTFail("Default Error")
        }
    }
    
    
    func testGivenManyOperation_WhenAddingOperators_ThenResultShouldBeCorrect() {
        do {
            try calc.addInteger(number: "1")
        } catch CalculError.integerError {
            XCTFail("Integer Fail")
        } catch {
            XCTFail("Default Error")
        }
        do {
            try calc.addOperator(symbol: "+")
        } catch CalculError.operandError {
            XCTFail("Operand Fail")
        } catch {
            XCTFail("Default Error")
        }
        do {
            try calc.addInteger(number: "3")
        } catch CalculError.integerError {
            XCTFail("Integer Fail")
        } catch {
            XCTFail("Default Error")
        }
        do {
            try calc.addOperator(symbol: "+")
        } catch CalculError.operandError {
            XCTFail("Operand Fail")
        } catch {
            XCTFail("Default Error")
        }
        do {
            try calc.addInteger(number: "5")
        } catch CalculError.integerError {
            XCTFail("Integer Fail")
        } catch {
            XCTFail("Default Error")
        }
        do {
            try calc.equal()
        } catch CalculError.equalError {
            XCTFail("Equal Fail")
        } catch {
            XCTFail("Default Error")
        }
        XCTAssertEqual(calc.result, "1 + 3 + 5 = 9")
    }
    
    
    func testGivenOperation_WhenAddingSomePriorities_ThenResultShouldBeCorrect() {
        do {
            try calc.addInteger(number: "4")
        } catch CalculError.integerError {
            XCTFail("Integer Fail")
        } catch {
            XCTFail("Default Error")
        }
        do {
            try calc.addOperator(symbol: "+")
        } catch CalculError.operandError {
            XCTFail("Operand Fail")
        } catch {
            XCTFail("Default Error")
        }
        do {
            try calc.addInteger(number: "9")
        } catch CalculError.integerError {
            XCTFail("Integer Fail")
        } catch {
            XCTFail("Default Error")
        }
        do {
            try calc.addOperator(symbol: "x")
        } catch CalculError.operandError {
            XCTFail("Operand Fail")
        } catch {
            XCTFail("Default Error")
        }
        do {
            try calc.addInteger(number: "10")
        } catch CalculError.integerError {
            XCTFail("Integer Fail")
        } catch {
            XCTFail("Default Error")
        }
        do {
            try calc.equal()
        } catch CalculError.equalError {
            XCTFail("Equal Fail")
        } catch {
            XCTFail("Default Error")
        }
        XCTAssertEqual(calc.result, "4 + 9 x 10 = 94")
    }
    
    func testGivenOperation_WhenAddingBigNumbers_ThenResultShouldBeCorrectAndDouble() {
        do {
            try calc.addInteger(number: "9")
            try calc.addInteger(number: "0")
            try calc.addInteger(number: "0")
            try calc.addInteger(number: "3")
            try calc.addInteger(number: "4")
            try calc.addInteger(number: "9")
            try calc.addInteger(number: "1")
            try calc.addInteger(number: "2")
            try calc.addInteger(number: "3")
            try calc.addInteger(number: "3")
            try calc.addInteger(number: "2")
            try calc.addInteger(number: "1")
        } catch CalculError.integerError {
            XCTFail("Integer Fail")
        } catch {
            XCTFail("Default Error")
        }
        do {
            try calc.addOperator(symbol: "+")
        } catch CalculError.operandError {
            XCTFail("Operand Fail")
        } catch {
            XCTFail("Default Error")
        }
        do {
            try calc.addInteger(number: "9")
            try calc.addInteger(number: "0")
            try calc.addInteger(number: "0")
            try calc.addInteger(number: "3")
            try calc.addInteger(number: "4")
            try calc.addInteger(number: "9")
            try calc.addInteger(number: "1")
            try calc.addInteger(number: "2")
            try calc.addInteger(number: "3")
            try calc.addInteger(number: "3")
            try calc.addInteger(number: "2")
            try calc.addInteger(number: "1")
        } catch CalculError.integerError {
            XCTFail("Integer Fail")
        } catch {
            XCTFail("Default Error")
        }
        do {
            try calc.equal()
        } catch CalculError.equalError {
            XCTFail("Equal Fail")
        } catch {
            XCTFail("Default Error")
        }
        XCTAssertEqual(calc.result, "900349123321 + 900349123321 = 1800698246642.0")
    }
    
    
    
    func testGivenOperation_WhenAddingBigNumbers_ThenResultShouldBeDoubleAndCorrect() {
        do {
            try calc.addInteger(number: "2")
            try calc.addInteger(number: "1")
            try calc.addInteger(number: "4")
            try calc.addInteger(number: "7")
            try calc.addInteger(number: "4")
            try calc.addInteger(number: "8")
            try calc.addInteger(number: "3")
            try calc.addInteger(number: "6")
            try calc.addInteger(number: "4")
            try calc.addInteger(number: "7")
        } catch CalculError.integerError {
            XCTFail("Integer Fail")
        } catch {
            XCTFail("Default Error")
        }
        do {
            try calc.addDot()
        } catch CalculError.dotError {
            XCTFail("Dot Fail")
        } catch {
            XCTFail("Default Error")
        }
        do {
            try calc.addInteger(number: "4")
        } catch CalculError.integerError {
            XCTFail("Integer Fail")
        } catch {
            XCTFail("Default Error")
        }
        do {
            try calc.addOperator(symbol: "+")
        } catch CalculError.operandError {
            XCTFail("Operand Fail")
        } catch {
            XCTFail("Default Error")
        }
        do {
            try calc.addInteger(number: "2")
            try calc.addInteger(number: "1")
            try calc.addInteger(number: "4")
            try calc.addInteger(number: "7")
            try calc.addInteger(number: "4")
            try calc.addInteger(number: "8")
            try calc.addInteger(number: "3")
            try calc.addInteger(number: "6")
            try calc.addInteger(number: "4")
            try calc.addInteger(number: "7")
        } catch CalculError.integerError {
            XCTFail("Integer Fail")
        } catch {
            XCTFail("Default Error")
        }
        do {
            try calc.addDot()
        } catch CalculError.dotError {
            XCTFail("Dot Fail")
        } catch {
            XCTFail("Default Error")
        }
        do {
            try calc.addInteger(number: "5")
        } catch CalculError.integerError {
            XCTFail("Integer Fail")
        } catch {
            XCTFail("Default Error")
        }
        do {
            try calc.equal()
        } catch CalculError.equalError {
            XCTFail("Equal Fail")
        } catch {
            XCTFail("Default Error")
        }
        XCTAssertEqual(calc.result, "2147483647.4 + 2147483647.5 = 4294967294.9")
    }
    
    func testGivenOperation_WhenIsDividedByZero_ThenAnErrorIsThrowed() {
        do {
            try calc.addInteger(number: "1")
            try calc.addOperator(symbol: "/")
            try calc.addInteger(number: "0")
            try calc.equal()
        }  catch CalculError.zeroError {
            XCTAssert(true)
        } catch {
            XCTFail("Default Error")
        }
    }
    
    func testGivenSimpleOperation_WhenDividingAZero_ThenResultShouldBeCorrect() {
        do {
            try calc.addInteger(number: "0")
        } catch CalculError.integerError {
            XCTFail("Integer Fail")
        } catch {
            XCTFail("Default Error")
        }
        do {
            try calc.addOperator(symbol: "/")
        } catch CalculError.operandError {
            XCTFail("Operand Fail")
        } catch {
            XCTFail("Default Error")
        }
        do {
            try calc.addInteger(number: "3")
        } catch CalculError.integerError {
            XCTFail("Integer Fail")
        } catch {
            XCTFail("Default Error")
        }
        do {
            try calc.equal()
        } catch CalculError.equalError {
            XCTFail("Equal Fail")
        } catch {
            XCTFail("Default Error")
        }
        XCTAssertEqual(calc.result, "0 / 3 = 0")
    }
    
    func testGivenSimpleOperation_WhenAddingBigNumbersWithManyOperations_ThenResultShouldBeCorrect() {
        do {
            try calc.addInteger(number: "2")
            try calc.addInteger(number: "1")
            try calc.addInteger(number: "4")
            try calc.addInteger(number: "7")
            try calc.addInteger(number: "4")
            try calc.addInteger(number: "8")
            try calc.addInteger(number: "3")
            try calc.addInteger(number: "6")
            try calc.addInteger(number: "4")
            try calc.addInteger(number: "7")
        } catch CalculError.integerError {
            XCTFail("Integer Fail")
        } catch {
            XCTFail("Default Error")
        }
        do {
            try calc.addDot()
        } catch CalculError.dotError {
            XCTFail("Dot Fail")
        } catch {
            XCTFail("Default Error")
        }
        do {
            try calc.addInteger(number: "7")
            try calc.addInteger(number: "4")
            try calc.addInteger(number: "7")
        } catch CalculError.integerError {
            XCTFail("Integer Fail")
        } catch {
            XCTFail("Default Error")
        }
        do {
            try calc.addOperator(symbol: "+")
        } catch CalculError.operandError {
            XCTFail("Operand Fail")
        } catch {
            XCTFail("Default Error")
        }
        do {
            try calc.addInteger(number: "2")
            try calc.addInteger(number: "1")
            try calc.addInteger(number: "4")
            try calc.addInteger(number: "7")
            try calc.addInteger(number: "4")
            try calc.addInteger(number: "8")
            try calc.addInteger(number: "3")
            try calc.addInteger(number: "6")
            try calc.addInteger(number: "4")
            try calc.addInteger(number: "7")
        } catch CalculError.integerError {
            XCTFail("Integer Fail")
        } catch {
            XCTFail("Default Error")
        }
        do {
            try calc.addDot()
        } catch CalculError.dotError {
            XCTFail("Dot Fail")
        } catch {
            XCTFail("Default Error")
        }
        do {
            try calc.addInteger(number: "5")
            try calc.addInteger(number: "4")
            try calc.addInteger(number: "7")
        } catch CalculError.integerError {
            XCTFail("Integer Fail")
        } catch {
            XCTFail("Default Error")
        }
        do {
            try calc.addOperator(symbol: "+")
        } catch CalculError.operandError {
            XCTFail("Operand Fail")
        } catch {
            XCTFail("Default Error")
        }
        do {
            try calc.addInteger(number: "1")
        } catch CalculError.integerError {
            XCTFail("Integer Fail")
        } catch {
            XCTFail("Default Error")
        }
        do {
            try calc.equal()
        } catch CalculError.equalError {
            XCTFail("Equal Fail")
        } catch {
            XCTFail("Default Error")
        }
        XCTAssertEqual(calc.result, "2147483647.747 + 2147483647.547 + 1 = 4294967296.294")
    }
    
    func testGivenAnOperation_WhenAddingManyOperators_ThenResultShouldBeCorrect() {
        do {
            try calc.addInteger(number: "7")
            try calc.addInteger(number: "5")
            try calc.addInteger(number: "4")
            try calc.addInteger(number: "3")
            try calc.addInteger(number: "2")
        } catch CalculError.integerError {
            XCTFail("Integer Fail")
        } catch {
            XCTFail("Default Error")
        }
        do {
            try calc.addOperator(symbol: "-")
        } catch CalculError.operandError {
            XCTFail("Operand Fail")
        } catch {
            XCTFail("Default Error")
        }
        do {
            try calc.addInteger(number: "8")
            try calc.addInteger(number: "7")
        } catch CalculError.integerError {
            XCTFail("Integer Fail")
        } catch {
            XCTFail("Default Error")
        }
        do {
            try calc.addOperator(symbol: "x")
        } catch CalculError.operandError {
            XCTFail("Operand Fail")
        } catch {
            XCTFail("Default Error")
        }
        do {
            try calc.addInteger(number: "3")
        } catch CalculError.integerError {
            XCTFail("Integer Fail")
        } catch {
            XCTFail("Default Error")
        }
        do {
            try calc.addOperator(symbol: "+")
        } catch CalculError.operandError {
            XCTFail("Operand Fail")
        } catch {
            XCTFail("Default Error")
        }
        do {
            try calc.addInteger(number: "7")
            try calc.addInteger(number: "6")
        } catch CalculError.integerError {
            XCTFail("Integer Fail")
        } catch {
            XCTFail("Default Error")
        }
        do {
            try calc.addOperator(symbol: "x")
        } catch CalculError.operandError {
            XCTFail("Operand Fail")
        } catch {
            XCTFail("Default Error")
        }
        do {
            try calc.addInteger(number: "5")
            try calc.addInteger(number: "4")
            try calc.addInteger(number: "6")
            try calc.addInteger(number: "7")
        } catch CalculError.integerError {
            XCTFail("Integer Fail")
        } catch {
            XCTFail("Default Error")
        }
        do {
            try calc.equal()
        } catch CalculError.equalError {
            XCTFail("Equal Fail")
        } catch {
            XCTFail("Default Error")
        }
        XCTAssertEqual(calc.result, "75432 - 87 x 3 + 76 x 5467 = 490663")
    }
    
    func testGivenInteger_WhenEraseButtonIsPressed_ThenTheElementsAreErased() {
        do {
            try calc.addInteger(number: "1")
        } catch CalculError.integerError {
            XCTFail("Integer Fail")
        } catch {
            XCTFail("Default Error")
        }
        
        do {
            try calc.reset()
        }  catch CalculError.eraseError {
            XCTFail("Erase Fail")
        } catch {
            XCTFail("Default Error")
        }
        XCTAssertEqual(calc.result, "")
    }
    
    func testGivenOperand_WhenAddingDot_ThenAnErrorIsOccured() {
        do {
            try calc.addOperator(symbol: "+")
        } catch CalculError.operandError {
            XCTFail("Operand Fail")
        } catch {
            XCTFail("Default Error")
        }
        do {
            try calc.addDot()
        }  catch CalculError.dotOperandError {
            XCTAssert(true)
        } catch {
            XCTFail("Default Error")
        }
    }
    
    func testGivenEmptyString_WhenAddingDot_ThenAnErrorIsOccured() {
        do {
            try calc.addDot()
        }  catch CalculError.dotErrorEmpty {
            XCTAssert(true)
        } catch {
            XCTFail("Default Error")
        }
    }
    
    func testGivenNumberAndDot_WhenAddingDot_ThenAnErrorIsOccured() {
        do {
            try calc.addInteger(number: "1")
        }  catch CalculError.integerError {
            XCTFail("Integer Error")
        } catch {
            XCTFail("Default Error")
        }
        do {
            try calc.addDot()
        }  catch CalculError.dotError {
            XCTFail("Dot Error")
        } catch {
            XCTFail("Default Error")
        }
        do {
            try calc.addDot()
        }  catch CalculError.dotError {
            XCTAssert(true)
        } catch {
            XCTFail("Default Error")
        }
    }
    
}
