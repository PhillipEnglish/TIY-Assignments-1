//
//  Location.swift
//  DudeCar
//
//  Created by Jennifer Hamilton on 11/3/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

// NSCoding Constants
let kNameKey = "name"
let kLatitudeKey = "latitude"
let kLongitudeKey = "longitude"

class Location: NSObject, NSCoding
{
    let name: String
    let lat: Double
    let lng: Double
    
    init(name: String, lat: Double, lng: Double)
    {
        self.name = name
        self.lat = lat
        self.lng = lng
    }
    
    // MARK: - NSCoding (serialization)
    
    required convenience init?(coder aDecoder: NSCoder)
    {
        // guard = if the 2 statements after guard are true, continue to self.init code. otherwise move to else statment and break
        guard let name = aDecoder.decodeObjectForKey(kNameKey) as? String
            else { return nil }
        
        self.init(name: name, lat: aDecoder.decodeDoubleForKey(kLatitudeKey), lng: aDecoder.decodeDoubleForKey(kLongitudeKey))
        
    }
    
    func encodeWithCoder(aCoder: NSCoder)
    {
        aCoder.encodeObject(self.name, forKey: kNameKey)
        aCoder.encodeDouble(self.lat, forKey: kLatitudeKey)
        aCoder.encodeDouble(self.lng, forKey: kLongitudeKey)
    }
    

}