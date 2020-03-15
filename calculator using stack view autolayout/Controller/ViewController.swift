//
//  ViewController.swift
//  calculator using stack view autolayout
//
//  Created by MAHMOUD on 10/25/19.
//  Copyright © 2019 MAHMOUD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    var isfinishedTypingNumber:Bool=true
    @IBOutlet weak var resLabel: UILabel!
    
    private var displayValue:Double{
        get{
            guard let number = Double(resLabel.text!) else{
                fatalError("Can not Convert what inside label to double")
            }
            return number
        }
        set{
            resLabel.text = String(newValue)
        }
    }
    
    
    
    private var calc = CalculatorLogic()
    @IBAction func calacButtonPressed(_ sender: UIButton) {
        isfinishedTypingNumber = true
        calc.setNumber(displayValue)
        if let calcOperation = sender.currentTitle{
            
            if let res = calc.calculate(sympol: calcOperation){
                displayValue = res
            }
        }
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let numValue=sender.currentTitle{
            if isfinishedTypingNumber{
                resLabel.text=numValue
                isfinishedTypingNumber=false
            }
            else{
                if numValue == "."{
                  
                    let isDouble = floor(displayValue) != displayValue
                    if isDouble == true{
                        // not complete to avoid add more "."
                        return
                    }
                }
                resLabel.text=resLabel.text!+numValue
            }
        }
    }
}

