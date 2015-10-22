//
//  Calculator.swift
//  HighVoltage
//
//  Created by Jennifer Hamilton on 10/22/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

class Calculator
{
    
    var op1: Double?
    var op2: Double?
    var operatorSelection = ""
    var numberString: String?
    var isNumberCompleted: Bool?
    
    init()
    {
    op1 = nil
    op2 = nil
    operatorSelection = ""
    numberString = ""
    isNumberCompleted = false
    }
    
    func setDigit(digitAsString: String)
    {
    numberString! += digitAsString
    
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
    
    isNumberCompleted = true
    numberString = ""
    }
    
    func setSymbol(symbol: String)
    {
    operatorSelection = symbol
    
    }
    
    func setSpecialButton(specialButton: String) -> String
    {
    isNumberCompleted = true
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
    
    if op1 == nil
    {
    op1 = digit
    }
    else
    {
    op2 = digit
    }
    
    return String(digit!)
    }
    
    func getFullNumber() -> String
    {
    return numberString!
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
