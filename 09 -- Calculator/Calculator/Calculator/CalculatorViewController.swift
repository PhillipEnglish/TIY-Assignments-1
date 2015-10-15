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
    
    var finalNumber = ""
    var numberCompleted = false
    var finalAnswer = ""
    
    var calculatorObject: CalculatorBrain?
    
    var op1: String?
    var op2: String?
    var operatorSelection: String?
    

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
        finalNumber += sender.currentTitle!
        displayLabel.text = "\(finalNumber)"
    }

    @IBAction func operatorButton(sender: UIButton)
    {
        displayLabel.text = "\(finalNumber)"
        if op1 == nil
        {
            op1 = finalNumber
        }
        else
        {
            op2 = finalNumber
        }
        
        numberCompleted = true
        operatorSelection = String(operatorButton)
        finalNumber = ""
    }

    @IBAction func equalsButton(sender: AnyObject)
    {
        numberCompleted = true
        displayLabel.text = "\(finalNumber)"
        op2 = finalNumber
        sendToCalculator()
    }
    
    @IBAction func clearbutton(sender: UIButton)
    {
        
    }
    
    func sendToCalculator()
    {
        let answer = CalculatorBrain(x: op1!,y: op2!)
        answer.calculate(operatorSelection!)
        finalAnswer = String(answer)
        op1 = nil
        op2 = nil
    }
    
    func displayAnswer(answer: String)
    {
        displayLabel.textColor = UIColor.greenColor()
        displayLabel.text = "\(finalAnswer)"
    }
    
    func clearDisplay()
    {
        displayLabel.textColor = UIColor.whiteColor()
        displayLabel.text = ""
    }

}

