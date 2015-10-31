//
//  Weather.swift
//  Forecaster
//
//  Created by Jennifer Hamilton on 10/29/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

struct Weather
{
    let summary: String
    let icon: String
//    let precipProbability: Double
//    let precipIntensity: Double
    let temperature: Double
//    let apparentTemperature: Double
//    let dewpoint: Double
//    let humidity: Double
//    let windSpeed: Double
//    let windBearing: Double
//    let visibility: Double
//    let cloudCover: Double
//    let pressure: Double

    
    init(summary: String, icon: String, temperature: Double)
    {
        self.summary = summary
        self.icon = icon
        self.temperature = temperature
    }
    
    static func weatherWithJSON(weatherDictionaryResults: NSDictionary) -> Weather
    {
        var weather = Weather?()
        
            let summary = weatherDictionaryResults["summary"] as! String
            let icon = weatherDictionaryResults["icon"] as! String
            let temperature = weatherDictionaryResults["temperature"] as! Double
            
            weather = Weather( summary: summary, icon: icon, temperature: temperature)
        
        return weather!
    }
    
    
}

