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
    private var picks = Array<Int>()
    
    var winner: Bool
    
    var timesAWinner = 0
    var payout: String
  
    //initialize with an array of 6 unique numbers between 1 and 53
    init()
    {
        winner = false
        payout = ""
        for _ in 0..<6
        {
            createPick()
        }
    }
    
    init(picksArray: Array<Int>)
    {
        winner = false
        payout = ""
        for i in 0...(picksArray.count)
        {
            picks.append(picksArray[i])
        }

    }
    
    func createPick()
    {
        var pickFound = false
        repeat
        {
            let aPick = Int(arc4random() % 53 + 1)
            if !picks.contains(aPick)
            {
                picks.append(aPick)
                pickFound = true
            }
        
        } while !pickFound
    }
    
    func description() -> String
    {
        var numbers = ""
        for pick in picks.sort()
        {
            numbers += " \(pick)"
        }
        return numbers
    }
    
    func compareWithTicket(anotherTicket: LotteryTicket)
    {
        let anotherticketPicks = anotherTicket.picksArray()
        var matchCount = 0
        
        for APossiblePick in anotherticketPicks
        {
            if picks.contains(APossiblePick)
            {
                matchCount++
            }
        }
        
        switch matchCount
        {
        case 3:
            winner = true
            payout = "$1"
        case 4:
            winner = true
            payout = "$5"
        case 5:
            winner = true
            payout = "$20"
        case 6:
            winner = true
            payout = "$100"
        default:
            winner = false
            payout = ""
        }
    }
}
    /*
    
    init(){
        var i = 0
        //limit it to 6 numbers
        while i <= 6
        {
            let num = generateNumber()
            if picks.contains(num)
            // if num is already in array, generate a new num
            {
                generateNumber()
            }
            else
            //if number does not == a number currently in array, append
            {
                picks.append(num)
                i++
            }
        }
    }

    func toString() -> String
    {
        return "\(picks)"
    }

    
    func generateNumber() -> Int
    {
        return Int(arc4random() % 53)
    }

    
    func compareTicket(userTicket: Array<Int>, winningTicket: Array<Int>) -> Bool
    {
        // Create a compareTicket  
        // method that takes a ticket object as an argument and compares it with the another ticket to determine how many digits are the same. used to change the cell color
        for x in userTicket
        {
            if winningTicket.contains(x)
            {
                timesAWinner++
                return true
            }
            else
            {
                return false
            }
        }
        return false
    }
    
    // assign prizes
    // if a ticket is a winner, then you need to determine how many numbers are right to assign prize
    func assignPrize() -> Int
    {
        // may be better in compareTicket method
        switch timesAWinner {
            case 3:
                return 1
            case 4:
                return 5
            case 5:
                return 20
            case 6:
                return 100
            default:
                return 0
        }

    }
*/

