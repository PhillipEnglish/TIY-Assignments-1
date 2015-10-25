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
    var amps: Double = 0.0
    var ohms: Double = 0.0
    var watts: Double = 0.0
    var volts: Double = 0.0
    
    var ampsExists = false
    var ohmsExists = false
    var voltsExists = false
    var wattsExists = false

    var resultsDictionary = [String:String]()
    
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
            default:
                volts = Double(value)!
                voltsExists = true
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
        
        resultsDictionary["Amps"] = String(amps)
        resultsDictionary["Ohms"] = String(ohms)
        resultsDictionary["Volts"] = String(volts)
        resultsDictionary["Watts"] = String(watts)
       
        return resultsDictionary
    }
    
    func clearCalculator()
    {
        amps = 0.0
        ohms = 0.0
        volts = 0.0
        watts = 0.0
        resultsDictionary.removeAll()
    }
}



