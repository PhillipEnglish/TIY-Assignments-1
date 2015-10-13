//
//  LotteryTicket.swift
//  Jackpot
//
//  Created by Jennifer Hamilton on 10/13/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

class LotteryTicket
{
//    var ticketString: String
    var arrayOfNum: Array<Int> = []
  
    //initialize with an array of 6 unique numbers between 1 and 53
    init()
    {
        var i = 0
        //limit it to 6 numbers
        if i <= 6
        {
            var num = generateNumber()
            if arrayOfNum.contains(num)
                // if num is already in array, generate a new num
            {
                generateNumber()
            }
            else
            //if number does not == a number currently in array, append
            {
                arrayOfNum.append(num)
                i++
            }
        }
    }
    
    func toString() -> String
    {
        var ticketString = "\(arrayOfNum)"
        return ticketString
    }

    
    func generateNumber() -> Int
    {
        return Int(arc4random() % 53)
    }
    

}
