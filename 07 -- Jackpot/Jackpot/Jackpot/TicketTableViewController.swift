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
    func ticketWasChosen(winningNumber: LotteryTicket) // array of LotteryTickets?
}

class TicketTableViewController: UITableViewController, TicketPickerDelegate
{
    
    var ticketTableArray = Array<String>()
    var ticketNumber = 1

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
    
    func ticketWasChosen(winningNumber: LotteryTicket)
    {

        // passing data from TimerPicker class to current class when the "Back" button is selected
        winningNumber

    }


    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    // MARK: - Table View

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ticketTableArray.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("TicketCell", forIndexPath: indexPath)
        
        // Configure the cell...
        let aTicket = ticketTableArray[indexPath.row]
        cell.textLabel?.text = String(aTicket)
        
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
        ticketTableArray.append("Ticket \(ticketNumber): \(aTicket.toString())")
        ticketNumber++
        tableView.reloadData()
    }
}




