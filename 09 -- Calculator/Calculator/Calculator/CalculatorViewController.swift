//
//  ViewController.swift
//  Calculator
//
//  Created by Jennifer Hamilton on 10/15/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController
{
    
    @IBOutlet weak var displayLabel: UILabel!
    
    var calculator = CalculatorBrain()
//    var finalAnswer: String?

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Action Handler
    
    @IBAction func numberButton(sender: UIButton)
    {
        calculator.setDigit(sender.currentTitle!)
        displayLabel.text = "\(calculator.getFullNumber())"
    }

    @IBAction func operatorButton(sender: UIButton)
    {
        calculator.setOperator(calculator.getFullNumber())
        calculator.setSymbol(sender.currentTitle!)
    }

    @IBAction func equalsButton(sender: UIButton)
    {
        calculator.setOperator(calculator.getFullNumber())
        displayLabel.text = "\(calculator.calculate())"
        calculator.clearCalculator()
    }
    
    @IBAction func clearbutton(sender: UIButton)
    {
        displayLabel.text = "0"
    }
}

