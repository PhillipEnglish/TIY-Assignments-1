//
//  TicketTableViewController.swift
//  Jackpot
//
//  Created by Jennifer Hamilton on 10/13/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

// @objc protocol <- used when you make your own delegate. delegates are used to link, or grab data, from another class

// delegate created in this class, because it will be the receiving class

protocol TicketPickerDelegate
{
    func winningTicketWasAdded(ticket: LotteryTicket) // array of LotteryTickets?
}

class TicketTableViewController: UITableViewController, TicketPickerDelegate
{
    
    var ticketTableArray = Array<LotteryTicket>()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        title = "Lottery Tickets"
        loadTickets()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "TicketTableToPickerSegue"
        {
            let ticketPickerVC = segue.destinationViewController
                as! WinningTicketPickerViewController
            ticketPickerVC.delegate = self
        }
    }
    
    // MARK: - TimerPicker Delegate
    
    func winningTicketWasAdded(ticket: LotteryTicket)
    {
        // passing data from TimerPicker class to current class when the "Back" button is selected
        checkForWinnerUsingTicket(ticket)

    }


    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ticketTableArray.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("TicketCell", forIndexPath: indexPath)

        let aTicket: LotteryTicket = ticketTableArray[indexPath.row]
        cell.textLabel?.text = aTicket.description()
        // TODO: if it's a winner, change the cell color here & display prizeLevel
        
        
        return cell
    }
    
    // MARK: - Navigation
    
    @IBAction func addButton(sender: UIBarButtonItem)
    {
        loadTickets()
    }
    
    
    // MARK: - Private
    
    private func loadTickets()
    {
        let aTicket = LotteryTicket()
        ticketTableArray.append(aTicket)
        tableView.reloadData()
    }
    
    // TODO: compare two tickets, change cell color if it's a winner, list prize amount
    func checkForWinnerUsingTicket(winningTicket: LotteryTicket)
    {
//        compare winningTicket to tickets in Array
//        if it's a winner, turn the cell green
//        if a winner, grab the aTicket.assignPrize to determine what goes on the label
        for ticket in ticketTableArray
        {
            ticket.compareWithTicket(winningTicket)
        }
        
        
        tableView.reloadData()
    }
}




