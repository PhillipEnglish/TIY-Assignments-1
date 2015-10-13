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

     var ticketNumbers = Array<Int>()
    
    //initialize with an array of 6 unique numbers between 1 and 53
    init(num: Int)
    {
        var arrayOfNum: Array<Int> = []
        
        var i = 0
        
        //limit it to 6 numbers
        if i <= 6
        {
            if arrayOfNum.contains(num)
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
        
        ticketNumbers = arrayOfNum
    }
    
    // Source: http://forums.macrumors.com/threads/generating-random-numbers-with-xcode-7-and-swift-2.1915674/
    func generateNumber() -> UInt
    {
        var randomNum: UInt = 0
        arc4random_buf(&randomNum, sizeof(UInt))
        return 1 + (randomNum % (53 - 1))
    }
}
