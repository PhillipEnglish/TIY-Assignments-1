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
    var valuesToCalc = [String: String]()
    
    var amps: Double = 0.0
    var ohms: Double = 0.0
    var watts: Double = 0.0
    var volts: Double = 0.0
    
    init(dictionary: [String:String])
    {

    }
    
    func setupCalc(dictionary: [String:String])
    {
        for (key, value) in dictionary
        {
            switch key
            {
            case "Amps":
                amps = Double(value)!
            case "Ohms":
                ohms = Double(value)!
            case "Watts":
                watts = Double(value)!
            case "Volts":
                volts = Double(value)!
            default: break
        
            }
        }
    }
    


    
}
