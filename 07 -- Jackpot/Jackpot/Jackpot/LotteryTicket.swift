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
    init()
    {
        var arrayOfNum: Array<Int> = []
//        var ticketNumbers = Array<Int>()
        var ticketString: String
        
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
        
        ticketString = String(arrayOfNum)
//        ticketNumbers = arrayOfNum
    }
    
    // Source: http://forums.macrumors.com/threads/generating-random-numbers-with-xcode-7-and-swift-2.1915674/
    func generateNumber() -> Int
    {
        var randomNum: Int = 0
        arc4random_buf(&randomNum, sizeof(Int))
        
        return 1 + (randomNum % (53 - 1))
        
        // from Counter app, not as precise as above
//        return Int(arc4random() % 53)
    }
    

}
