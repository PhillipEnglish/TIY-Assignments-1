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
    var newTicket: Array<Int> = []
    
    var isWinning: Bool = false
    var prizeAmt: Int?
  
    //initialize with an array of 6 unique numbers between 1 and 53
    init()
    {
        var i = 0
        //limit it to 6 numbers
        while i <= 6
        {
            let num = generateNumber()
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
    
    init(arrayFromViewPicker: Array<Int>)
    {
        newTicket = arrayFromViewPicker
    }
    
    func toString() -> String
    {
        return "\(arrayOfNum)"
    }

    
    func generateNumber() -> Int
    {
        return Int(arc4random() % 53)
    }
    
    func compareTicket(userTicket: LotteryTicket, winningTicket: LotteryTicket)
    {
        // TODO: Create a compareTicket  
        // method that takes a ticket object as an argument and compares it with the another ticket to determine how many digits are the same. used to change the cell color
        for x in userTicket
        {
            if winningTicket.contains(x)
            {
                isWinning = true
            }
            else
            {
                isWinning = false
            }
        }
    }
    
    // TODO: assign prizes
    // if a ticket is a winner, then you need to determine how many numbers are right to assign prize
    func assignPrize()
    {
        // may be better in compareTicket method
        var prize3 = 1
        var prize4 = 5
        var prize5 = 20
        var prize6 = 100
    }
}
