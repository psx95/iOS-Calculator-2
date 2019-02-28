//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2018.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTyping: Bool = true
    private var displayValue: Double {
        get {
            guard let returnValue = Double(displayLabel.text!) else {
                fatalError("Cannot convert input to Double")
            }
            return returnValue
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinishedTyping = true
        
        if let calcMethod = sender.currentTitle {
            if calcMethod == "+/-" {
                displayValue = displayValue * -1
            } else if calcMethod == "AC" {
                displayValue = 0
            } else if calcMethod == "%" {
                displayValue = displayValue / 100
            }
        }
    
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let numValue = sender.currentTitle {
            let currText = displayLabel.text!
            if isFinishedTyping {
                displayLabel.text = String(numValue)
                isFinishedTyping = false
            } else {
                if numValue == "." {
                    if displayValue == floor(displayValue) {
                        displayLabel.text = "\(currText)\(numValue)"
                    }
                } else {
                    displayLabel.text = "\(currText)\(numValue)"
                }
            }
        }
    
    }

}

