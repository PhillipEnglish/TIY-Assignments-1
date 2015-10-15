//
//  WinningTicketPickerViewController.swift
//  Jackpot
//
//  Created by Jennifer Hamilton on 10/14/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class WinningTicketPickerViewController: UIViewController, UIPickerViewDataSource
{
    
    
    @IBOutlet var picker: UIPickerView!
    // delegate property here. this is the 'sending' class
    var delegate: TicketPickerDelegate? //question mark means 'optional'
    var winningPicks = Array<Int>(count: 6, repeatedValue: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UIPickerView data source
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int
    {
        // number of wheels (horizontally) in view
        return 6
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return 53
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int /*this is the index of the array/set of data */, forComponent component: Int) -> String?
    {
        return "\(row + 1)"
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent componenet: Int)
    {
        winningPicks[componenet] = row + 1
    }
    
    // MARK: - Action Handlers
    
    @IBAction func checkTickets(sender: UIButton)
    {
        if winningPicks.count == 6
        {
            let winningTicket = LotteryTicket(picksArray: winningPicks)
            delegate?.winningTicketWasAdded(winningTicket)
        }
    }


    
}



