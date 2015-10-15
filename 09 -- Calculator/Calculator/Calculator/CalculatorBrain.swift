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
    var op1: Int?
    var op2: Int?
    var operatorX: String?
    var answer: Int?
    
    init(x: String, y: String)
    {
        op1 = Int(x)!
        op2 = Int(y)!
    }
    
    func calculate(operators: String) -> Int
    {
        
        switch operators
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
            return 5
        case "+/-":
            return 6
        default:
            return 0
        }
    }
    
    func specialSymbols(num: Int, symbol: String) -> Int
    {
        switch symbol
        {
            case "%":
                return num/100
            case "+/-":
               return num * -1
            default:
                return 0
        }
        
    }
    
//    func add(op1: Int, op2: Int) -> Int
//    {
//        return op1 + op2
//    }
//    
//    func subtract(op1: Int, op2: Int) -> Int
//    {
//        return op1 - op2
//    }
//    
//    func multiply(op1: Int, op2: Int) -> Int
//    {
//        return op1 * op2
//    }
//    
//    func divide(op1: Int, op2: Int) -> Int
//    {
//        return op1/op2
//    }
//    
//    func posOrNeg(op1: Int) -> Int
//    {
//        return op1 * -1
//    }
//    
//    func percent(op1: Int) -> Int
//    {
//        return op1/100
//    }
}
