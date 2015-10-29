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
    let location: String!
    
    init(name: String, location: String)
    {
        self.name = name
        self.location = location
    }
    
    static func citiesWithJSON(results: NSDictionary) -> [City]
    {
        var cities = [City]()
        
        if results.count > 0
        {
            let name = results.valueForKey("name") as? String ?? ""
            let location = results.valueForKey("location") as? String ?? ""
            
            cities.append(City(name: name, location: location))
        }
        return cities
    }
    
    
}