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
    var winningNumber: Array<Int> = []
    
    
    //    let cities = ["Orlando", "Winter Perk", "Longwood", "Maitland"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillDisappear(animated: Bool)
    {
        super.viewWillDisappear(animated)
        // pass winningTicket item to TicketTableViewController to compare against current tickets
        returnWinningNumber()
        let winningTicket = LotteryTicket(arrayFromViewPicker: winningNumber)
        delegate?.winningNumberSelected(winningTicket)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int
    {
        // number of wheels (horizontally) in view
        return 6
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        // FIXME: sets number of rows, for each picker (as identified by component)

        return [53][1]
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int /*this is the index of the array/set of data */, forComponent component: Int) -> String?
    {
        // FIXME: func for the delegate, passing the number of the row as the row title

        return ["\(row)"][1]
    }
    
    // TODO: capture the data from the picker, append into winningNumber array
//    func viewForRow(titleForRow row: Int, forComponent component: Int) -> UIView?
//    {
//        
//    }
    
    func returnWinningNumber()
    {
        // placeholder to check accuracy of delegation and compare function
        winningNumber = [1,2,3,4,5,6]
    }

    
}



