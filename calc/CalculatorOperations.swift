//
//  Operations.swift
//  calc
//
//  Created by Sumangala Rao on 17/3/2026.
//  Copyright © 2026 UTS. All rights reserved.
//
import Foundation

final class CalculatorOperations {

    func apply(op: String, lhs: Int, rhs: Int) throws -> Int {
        switch op {
        case "+":
            let result = lhs.addingReportingOverflow(rhs)
            if result.overflow {
                if rhs >= 0 {
                    throw CalculatorErrors.integerOverflow
                } else {
                    throw CalculatorErrors.integerUnderflow
                }
            }
            return result.partialValue

        case "-":
            let result = lhs.subtractingReportingOverflow(rhs)
            if result.overflow {
                if rhs >= 0 {
                    throw CalculatorErrors.integerUnderflow
                } else {
                    throw CalculatorErrors.integerOverflow
                }
            }
            return result.partialValue

        case "x":
            let result = lhs.multipliedReportingOverflow(by: rhs)
            if result.overflow {
                let sameSign = (lhs >= 0 && rhs >= 0) || (lhs < 0 && rhs < 0)
                if sameSign {
                    throw CalculatorErrors.integerOverflow
                } else {
                    throw CalculatorErrors.integerUnderflow
                }
            }
            return result.partialValue

        case "/":
            if rhs == 0 {
                throw CalculatorErrors.divideByZero
            }
            if lhs == Int.min && rhs == -1 {
                throw CalculatorErrors.integerOverflow
            }
            return lhs / rhs

        case "%":
            if rhs == 0 {
                throw CalculatorErrors.divideByZero
            }
            return lhs % rhs

        default:
            throw CalculatorErrors.invalidArg(op)
        }
    }
}
