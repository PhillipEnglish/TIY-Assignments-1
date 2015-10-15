//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Jennifer Hamilton on 10/15/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

class CalculatorBrain
{
    var op1: Double?
    var op2: Double?
    var operatorSelection = ""
    var numberString: String?
    var numberCompleted: Bool?
    
    init()
    {
        op1 = nil
        op2 = nil
        operatorSelection = ""
        numberString = ""
        numberCompleted = false
    }
//
//    init()
//    {
//        op1String = ""
//        op2String = ""
//        operatorSelection = ""
//    }
    
//    init(x: String, y: String, symbol: String)
//    {
//        op1 = Double(x)
//        op2 = Double(y)
//        operatorX = symbol
//    }
    
    func setDigit(digitAsString: String)
    {
        numberString! += digitAsString
        
    }
    
    func getFullNumber() -> String
    {
        return numberString!
    }
    
    func setOperator(fullNumString: String)
    {
        if op1 == nil
        {
            op1 = Double(fullNumString)
        }
        else
        {
            op2 = Double(fullNumString)
        }
        
        numberCompleted = true
        numberString = ""
    }
    
    func setSymbol(symbol: String)
    {
        operatorSelection = symbol
        
    }
    
    func setSpecialButton(specialButton: String) -> String
    {
        var digit = Double(numberString!)
        switch specialButton
        {
            case "+/-":
                digit = digit! * -1
            case "%":
                digit = digit! / 100
            default:
                0
        }
        
        return String(digit)
    }
    
    func calculate() -> Double
    {
        
        switch operatorSelection
        {
            case "+":
                return op1! + op2!
            case "-":
                return op1! - op2!
            case "x":
                return op1! * op2!
            case "÷":
                return op1! / op2!
            case "%":
                if op1 != nil
                {
                    return op1! / 100
                }
                else
                {
                    return op2! / 100
                }
            default:
                return 0
        }
    }
    
    func clearCalculator()
    {
        numberString = ""
        op1 = nil
        op2 = nil
        operatorSelection = ""
    }
}
