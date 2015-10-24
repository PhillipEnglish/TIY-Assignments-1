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
//    var valuesToCalc = [String: String]()
    
    var amps: Double = 0.0
    var ohms: Double = 0.0
    var watts: Double = 0.0
    var volts: Double = 0.0
    
    var ampsExists = false
    var ohmsExists = false
    var voltsExists = false
    var wattsExists = false

    
    
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
                ampsExists = true
            case "Ohms":
                ohms = Double(value)!
                ohmsExists = true
            case "Watts":
                watts = Double(value)!
                wattsExists = true
                //            case "Volts":
            default:
                volts = Double(value)!
                voltsExists = true
                //            default: break
                
            }
        }
                
        if voltsExists
        {
            if ohmsExists
            {
                amps = volts / ohms
                watts = (volts * volts)/ohms

            }
            else if ampsExists
            {
                ohms = volts / amps
                watts = volts * amps
            }
            else
            {
                amps = watts / volts
                ohms = (volts*volts) / watts
            }
        }
        else if ampsExists
        {
            if wattsExists
            {
                volts = watts / amps
                ohms = watts / (amps*amps)
            }
            else
            {
                volts = amps * ohms
                watts = (amps * amps) * ohms
            }
        }
        else
        {
            volts = sqrt(watts) * ohms
            amps = sqrt(watts) / ohms
        }
/*
        while amps == 0
        {
            if ohms > 0
            {
                amps = volts / ohms
                amps = sqrt(watts) / ohms
            }
            else
            {
                amps = watts / volts
            }
    
        }
    
        while ohms == 0
        {
            if amps > 0
            {
                ohms = volts / amps
                ohms = watts / (amps*amps)
            }
            else
            {
                ohms = (volts*volts) / watts
            }
        }

        while volts == 0
        {
            if ohms > 0
            {
                volts = amps * ohms
                volts = sqrt(watts) * ohms
            }
            else
            {
                volts = watts / amps
            }
        }
        
        while watts == 0
        {
            if ohms > 0
            {
                watts = (volts * volts)/ohms
                watts = (amps * amps) * ohms
            }
            else
            {
                watts = volts * amps
            }
        }
*/
        
        var resultDictionary = [String:String]()
        
        resultDictionary["Amps"] = String(amps)
        resultDictionary["Ohms"] = String(ohms)
        resultDictionary["Volts"] = String(volts)
        resultDictionary["Watts"] = String(watts)
       
        return resultDictionary
    }
   
}



