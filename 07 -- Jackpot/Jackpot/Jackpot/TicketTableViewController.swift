//
//  TicketTableViewController.swift
//  Jackpot
//
//  Created by Jennifer Hamilton on 10/13/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class TicketTableViewController: UITableViewController
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




