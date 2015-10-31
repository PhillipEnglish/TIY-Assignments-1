//
//  City.swift
//  Forecaster
//
//  Created by Jennifer Hamilton on 10/29/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

struct City
{
    let name: String
    let lat: Double
    let lng: Double
    let coordinates: [String: Double]
    var currentWeather: Weather?
    
    init(name: String, lat: Double, lng: Double, weatherObj: Weather?)
    {
        self.name = name
        self.lat = lat
        self.lng = lng
        self.coordinates = ["lat": lat, "lng": lng]
        if weatherObj != nil
        {
            self.currentWeather = weatherObj!
        }
        else
        {
            self.currentWeather = nil
        }
     }
        
    static func cityWithJSON(results: NSArray) -> City
    {
        var city: City
        var name = ""
        var lat = 0.0
        var lng = 0.0
        
        if results.count > 0
        {
            for result in results
            {
                let formattedAddress = result["formatted_address"] as? String
                let addressComponents = formattedAddress!.characters.split(",").map { String($0) }
                name =  addressComponents[0]
            
                let geometry = result["geometry"] as? NSDictionary
                let location = geometry?.valueForKey("location") as? NSDictionary
                lat = location?.valueForKey("lat") as! Double
                lng = location?.valueForKey("lng") as! Double
            }
        }
        city = City(name: name, lat: lat, lng: lng, weatherObj: nil)
        return city
    }
    
}
