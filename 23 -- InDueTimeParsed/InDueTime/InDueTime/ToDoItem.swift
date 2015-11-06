//
//  ToDoItem.swift
//  InDueTime
//
//  Created by Jennifer Hamilton on 10/20/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation


class ToDoItem
{
    var itemDescription: String
    var isComplete: Bool
    let objectId: String
    
    init(itemDescription: String, isComplete: Bool, objectId: String)
    {
        self.itemDescription = itemDescription
        self.isComplete = isComplete
        self.objectId = objectId
    }
    
}
