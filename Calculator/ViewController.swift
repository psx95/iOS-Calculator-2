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
    
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let numValue = sender.currentTitle {
            let currText = displayLabel.text!
            if isFinishedTyping {
                displayLabel.text = String(numValue)
                isFinishedTyping = false
            } else {
                displayLabel.text = "\(currText)\(numValue)"
            }
        }
    
    }

}

