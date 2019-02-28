//
//  File.swift
//  Calculator
//
//  Created by Pranav Sharma on 01/03/19.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

class CalculatorLogic {
    
    func performCalculation(forMethodSymbol methodSymbol: String, onValue value: Double) -> Double? {
        var calculationResult: Double? = nil
        if methodSymbol == "+/-" {
            calculationResult = value * -1
        } else if methodSymbol == "AC" {
            calculationResult = 0
        } else if methodSymbol == "%" {
            calculationResult = value / 100
        }
        return calculationResult
    }
}
