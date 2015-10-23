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
    let allMeasurements = ["Amps": "","Ohms": "","Volts": "","Watts": ""]
    var visibleMeasurements = Array<String>()
    var remainingMeasurements = ["Amps","Ohms","Volts","Watts"]
    
    var calculator: Calculator?
    
    @IBOutlet weak var addButton: UIBarButtonItem!
    @IBOutlet weak var instructionLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "⚡️ High Voltage ⚡️"
        instructionLabel.text = "Add two values to calculate: "
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
        let anItem = visibleMeasurements[indexPath.row]
        cell.measurementLabel.text = anItem
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
        
        // pass values into allMeasurements dicitonary
//        allMeasurements.calculate()
//        
//        // display results
//        for (key, value) in allMeasurements
//        {
//            measurementLable.text = key
//            dataTextField.text = value
//        }
    }
    
    @IBAction func clearButtonTapped(sender: UIBarButtonItem)
    {
        remainingMeasurements = visibleMeasurements
        visibleMeasurements.removeAll()
        addButton.enabled = true
        tableView.reloadData()
        instructionLabel.text = "Add two values to calculate: "
    }
    
    // TODO: when 2 items are selected and moved to list, provide a 'calculate' button
    
}