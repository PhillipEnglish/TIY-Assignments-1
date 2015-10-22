//
//  MeasurementTableViewController.swift
//  HighVoltage
//
//  Created by Jennifer Hamilton on 10/22/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

protocol MeasurementListTableViewControllerDelegate
{
    func measureWasChosen(chosenMeasurement: String)
}

class MeasurementTableViewController: UITableViewController, UIPopoverPresentationControllerDelegate, MeasurementListTableViewControllerDelegate
{
    let allMeasurements = ["Amps": "amps","Ohms": "ohms","Volts": "volts","Watts": "watts"]
    var visibleMeasurements = Array<String>()
    var remainingMeasurements = ["Amps","Ohms","Volts","Watts"]
    
    var calculate = Calculator()
    
    @IBOutlet weak var addButton: UIBarButtonItem!
    @IBOutlet weak var instructionLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "⚡️ High Voltage ⚡️"
        instructionLabel.text = "Please add 2 values, then press calculate."
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "ShowMeasurementListPopoverSegue"
        {
            let destVC = segue.destinationViewController as! MeasurementListTableViewController
            // set destination array to remainingMeasurments
            destVC.measurements = remainingMeasurements
            // take over modification of the popover view controller
            destVC.popoverPresentationController?.delegate = self
            // get that delegate info
            destVC.delegate = self
            // display just as tall as needed for the  Measurments left
            let contentHeight = 44.0 * CGFloat(remainingMeasurements.count)
            destVC.preferredContentSize = CGSizeMake(200.0, contentHeight)
        }
    }
    

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return visibleMeasurements.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("MeasurementCell", forIndexPath: indexPath) as! MeasurementCell

        // Configure the cell...
        let title = visibleMeasurements[indexPath.row]
        cell.measurementLabel.text = title
        cell.dataTextField.text = "000" // if data not entered, then blank, otherwise show calcuation result

        return cell
    }

    
    // MARK: - UIPopover Presentation Controller Delegate
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle
    {
        return .None // shorthand for UIModalPresentationStyle.None
    }
    
    // MARK: - CharacterListTableViewController Delegate
    
    func measureWasChosen(chosenMeasurement: String)
    {
        navigationController?.dismissViewControllerAnimated(true, completion: nil)
        visibleMeasurements.append(chosenMeasurement)
        
        let rowToRemove = (remainingMeasurements as NSArray).indexOfObject(chosenMeasurement)
        remainingMeasurements.removeAtIndex(rowToRemove)
        
        if remainingMeasurements.count == 2
        {
            // add and outlet for addButton
             addButton.enabled = false
            
            // use
        }
        
        tableView?.reloadData()
    }
    
    // MARK: - Action Handler
    
    @IBAction func calculateButton(sender: UIButton)
    {
        instructionLabel.text = "Your results are: "
    }
    
    @IBAction func clearButtonTapped(sender: UIBarButtonItem)
    {
        remainingMeasurements = visibleMeasurements
        visibleMeasurements.removeAll()
        addButton.enabled = true
        tableView.reloadData()
    }
    
    // TODO: when 2 items are selected and moved to list, provide a 'calculate' button
    
    

    
//    @IBAction func numberButton(sender: UIButton)
//    {
//        calculate.setDigit(sender.currentTitle!)
//        displayLabel.text = "\(calculate.getFullNumber())"
//    }
//    
//    @IBAction func operatorButton(sender: UIButton)
//    {
//        calculate.setOperator(calculator.getFullNumber())
//        calculate.setSymbol(sender.currentTitle!)
//        displayLabel.text = "\(sender.currentTitle!)"
//    }
//    
//    @IBAction func specialButton(sender: UIButton)
//    {
//        displayLabel.text = calculate.setSpecialButton(sender.currentTitle!)
//    }
//    
//    @IBAction func equalsButton(sender: UIButton)
//    {
//        calculate.setOperator(calculate.getFullNumber())
//        displayLabel.text = "\(calculate.calculate())"
//        calculate.clearCalculator()
//    }
//    
//    @IBAction func clearbutton(sender: UIButton)
//    {
//        calculate.clearCalculator()
//        displayLabel.text = "0"
//    }
}
