//
//  Sites.swift
//  GrailDiary
//
//  Created by Jennifer Hamilton on 10/19/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

class Sites {
    var name: String
    var location: String
    var circa: String
    var description: String
    var siteImage: String
    
    init(dictionary: NSDictionary)
    {
        name = dictionary["name"] as! String
        location = dictionary["location"] as! String
        circa = dictionary["circa"] as! String
        description = dictionary["description"] as! String
        siteImage = dictionary["image"] as! String
    }

}
