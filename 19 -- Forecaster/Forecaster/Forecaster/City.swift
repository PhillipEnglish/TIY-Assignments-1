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
    let name: String!
    let location: NSDictionary
    let lat: Double?
    let lng: Double?
    
    // create weather object
    
    init(name: String, location: NSDictionary)
    {
        self.name = name
        self.location = location
        self.lat = location.valueForKey("lat") as? Double
        self.lng = location.valueForKey("lat") as? Double
    }
        
    static func cityWithJSON(results: NSDictionary) -> City
    {
        var aCity: City!
        
        if results.count > 0
        {
           
                let formattedAddress = results.valueForKey("formatted_address") as? String
                let addressComponents = formattedAddress!.characters.split(",").map { String($0) }
                let name =  addressComponents[0]
                let geometry = results.valueForKey("geometry") as? NSDictionary
                
                let location = geometry!.valueForKey("location") as? NSDictionary
                
                aCity = (City(name: name, location: location!))
            
        }
        return aCity
    }
    
    
}