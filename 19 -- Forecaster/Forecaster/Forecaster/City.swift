//
//  City.swift
//  Forecaster
//
//  Created by Jennifer Hamilton on 10/29/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

// NSCoding Constants
let kNameKey = "name"
let kZipCodeKey = "zipCode"
let kLatitudeKey = "latitude"
let kLongitudeKey = "longitude"

class City//: NSObject, NSCoding
{
    let name: String!
    let location: NSDictionary
    let lat: Double?
    let lng: Double?
    var currentWeather: Weather?
    
    // create weather object
    
    init(name: String, location: NSDictionary, weather: Weather?)
    {
        self.name = name
        self.location = location
        self.lat = location.valueForKey("lat") as? Double
        self.lng = location.valueForKey("lng") as? Double
        
        if weather != nil
        {
            self.currentWeather = weather!
        }
        else
        {
            self.currentWeather = nil
        }
    }
    
    // MARK: - NSCoding (serialization)
//    
//    required convenience init?(coder aDecoder: NSCoder)
//    {
//        // guard = if the 2 statements after guard are true, continue to self.init code. otherwise move to else statment and break
//        guard let name = aDecoder.decodeObjectForKey(kNameKey) as? String, let zipCode = aDecoder.decodeObjectForKey(kZipCodeKey) as? String
//            else { return nil }
//        
//        self.init(name: name, zip: zipCode, lat: aDecoder.decodeDoubleForKey(kLatitudeKey), lng: aDecoder.decodeDoubleForKey(kLongitudeKey))
//        
//    }
//    
//    func encodeWithCoder(aCoder: NSCoder)
//    {
//        aCoder.encodeObject(self.name, forKey: kNameKey)
//        aCoder.encodeObject(self.zipCode, forKey: kZipCodeKey)
//        aCoder.encodeDouble(self.lat!, forKey: kLatitudeKey)
//        aCoder.encodeDouble(self.lng!, forKey: kLongitudeKey)
//    }
    
    // MARK: - Parse JSON
        
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
            
                
            aCity = (City(name: name, location: location!, weather: nil))
            
        }
        return aCity
    }
    
    
}
