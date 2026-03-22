//
//  ReadCmdArgs.swift
//  calc
//
//  Created by Sumangala Rao on 18/3/2026.
//  Copyright © 2026 UTS. All rights reserved.
//

import Foundation

final class ReadCmdArgs {

    private let args: [String]
    private var currentIndex: Int = 0
    private let opHelper = CalculatorOperations()

    init(args: [String]) {
        self.args = args
    }

    func read() throws -> Int {
        if args.isEmpty {
            throw CalculatorErrors.emptyInput
        }
        let finalAnswer = try readExpression()
        if currentIndex != args.count {
            throw CalculatorErrors.invalidExpression
        }
        return finalAnswer
    }

    // This is to Handle + and -
    private func readExpression() throws -> Int {
        var leftValue = try readTerm()
        while let currentArg = getCurrentArg(), currentArg == "+" || currentArg == "-" {
            let currentOperator = currentArg
            moveToNextArg()
            let rightValue = try readTerm()
            leftValue = try opHelper.apply(
                op: currentOperator,
                lhs: leftValue,
                rhs: rightValue
            )
        }
        return leftValue
    }

    // This is to Handle x, / and %
    private func readTerm() throws -> Int {
        var leftValue = try readNumber()
        while let currentArg = getCurrentArg(), currentArg == "x" || currentArg == "/" || currentArg == "%" {

            let currentOperator = currentArg
            moveToNextArg()

            let rightValue = try readNumber()

            leftValue = try opHelper.apply(
                op: currentOperator,
                lhs: leftValue,
                rhs: rightValue
            )
        }

        return leftValue
    }


    private func readNumber() throws -> Int {
        guard let currentArg = getCurrentArg() else {
            throw CalculatorErrors.invalidExpression
        }
        guard let numberValue = Int(currentArg) else {
            throw CalculatorErrors.invalidArg(currentArg)
        }
        moveToNextArg()
        return numberValue
    }

    private func getCurrentArg() -> String? {
        if currentIndex < args.count {
            return args[currentIndex]
        }
        return nil
    }

    private func moveToNextArg() {
        currentIndex += 1
    }
}
