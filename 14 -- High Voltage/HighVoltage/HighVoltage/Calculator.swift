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

    func calculate(dictionary: [String:String]) -> [String:String]
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
        
        while amps == 0
        {
            amps = volts / ohms
            amps = watts / volts
            amps = sqrt(watts) / ohms
        }
        
        while ohms == 0
        {
            ohms = volts / amps
            ohms = (volts*volts) / watts
            ohms = watts / (amps*amps)
        }

        while volts == 0
        {
            volts = amps * ohms
            volts = watts / amps
            volts = sqrt(watts) * ohms
        }
        
        while watts == 0
        {
            watts = volts * amps
            watts = (volts * volts)/ohms
            watts = (amps * amps) * ohms
        }
        
        var resultDictionary = [String:String]()
        
        resultDictionary["Amps"] = String(amps)
        resultDictionary["Ohms"] = String(ohms)
        resultDictionary["Volts"] = String(volts)
        resultDictionary["Watts"] = String(watts)
       
        return resultDictionary
    }
   
}



