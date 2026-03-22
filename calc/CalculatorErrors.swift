//
//  CalculatorErrors.swift
//  calc
//
//  Created by Sumangala Rao on 17/3/2026.
//  Copyright © 2026 UTS. All rights reserved.
//

import Foundation

enum CalculatorErrors: Error {
        case emptyInput
        case invalidArg(String)
        case invalidExpression
        case divideByZero
        case integerOverflow
        case integerUnderflow

        var message: String {
            switch self {
            case .emptyInput:
                return "No input provided."
            case .invalidArg(let arg):
                return "Invalid Argument passed: \(arg)"
            case .invalidExpression:
                return "Invalid expression."
            case .divideByZero:
                return "Division by zero."
            case .integerOverflow:
                return "Integer overflow occurred."
            case .integerUnderflow:
                return "Integer underflow occurred."
            }
        }
    }
