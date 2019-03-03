//
//  File.swift
//  Calculator
//
//  Created by Pranav Sharma on 01/03/19.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    var intermediateCalculation: (number: Double, method: String)?
    
    mutating func performCalculation(forMethodSymbol methodSymbol: String, onValue value: Double) -> Double? {
        var calculationResult: Double? = nil
        if methodSymbol == "+/-" {
            calculationResult = value * -1
        } else if methodSymbol == "AC" {
            calculationResult = 0
            intermediateCalculation = nil
        } else if methodSymbol == "%" {
            calculationResult = value / 100
        } else if methodSymbol == "=" {
            if let currentCalc = intermediateCalculation {
                calculationResult = computeResultFromTwoNumbers(number1: currentCalc.number, number2: value, method: currentCalc.method)
            }
        } else {
            intermediateCalculation = (value, methodSymbol)
        }
        return calculationResult
    }
    
    private func computeResultFromTwoNumbers (number1: Double, number2: Double, method: String) -> Double {
        switch method {
        case "+":
            return number1 + number2
        case "-":
            return number1 - number2
        case "÷":
            return number1 / number2
        case "×":
            return number1 * number2
        default:
            fatalError("operation passed does not match any cases")
        }
    }
}
