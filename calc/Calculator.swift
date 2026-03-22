//
//  Calculator.swift
//  calc
//
//  Created by Jacktator on 31/3/20.
//  Copyright © 2020 UTS. All rights reserved.
//

import Foundation

class Calculator {
    
    /// For multi-step calculation, it's helpful to persist existing result
    var currentResult = 0;
    
    /// Perform Addition
    ///
    /// - Author: Jacktator
    /// - Parameters:
    ///   - no1: First number
    ///   - no2: Second number
    /// - Returns: The addition result
    ///
    /// - Warning: The result may yield Int overflow.
    /// - SeeAlso: https://developer.apple.com/documentation/swift/int/2884663-addingreportingoverflow
    
    //Testing individual cases early on
    /*
     func add(no1: Int, no2: Int, no3:Int, no4:Int) -> Int {
        return no1 + no2 + no3 + no4;
    }*/
    
    //Testing individual cases early on
    /*func subtract(no1: Int, no2: Int) -> Int {
        return no1 - no2;
    }
     */
    
    
    func calculate(args: [String]) throws -> String {
        let calculateResult = ReadCmdArgs(args: args)
        let result = try calculateResult.read()
        return String(result)
    }
}
