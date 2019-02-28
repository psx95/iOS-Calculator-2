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
    
    var isFinishedTyping: Bool = true
    
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinishedTyping = true
        
        guard let number = Double(displayLabel.text!) else {
            fatalError("Cannot convert number to Double")
        }
        
        if let calcMethod = sender.currentTitle {
            if calcMethod == "+/-" {
                displayLabel.text = String(number * -1)
            } else if calcMethod == "AC" {
                displayLabel.text = String(0)
            } else if calcMethod == "%" {
                displayLabel.text = String (number / 100)
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
                    guard let currNumber = Double(displayLabel.text!) else {
                        fatalError("Cannot convert input to double")
                    }
                    if currNumber == floor(currNumber) {
                        displayLabel.text = "\(currText)\(numValue)"
                    }
                } else {
                    displayLabel.text = "\(currText)\(numValue)"
                }
            }
        }
    
    }

}

