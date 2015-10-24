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
    var valueDictionary = [String: String]()
    var visibleValues = Array<String>()
    var remainingMeasurements = ["Amps","Ohms","Volts","Watts"]
    var allMeasurements = ["Amps","Ohms","Volts","Watts"]
    var allValues = Array<String>()
    
    var calculator: Calculator?
    
    @IBOutlet weak var addButton: UIBarButtonItem!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var instructionLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "⚡️ High Voltage ⚡️"
        instructionLabel.text = "Add two values to calculate: "
        // TODO:  calculateButton.enable == true only when 2 values input
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "ShowMeasurementListPopoverSegue"
        {
            let destVC = segue.destinationViewController as! MeasurementListTableViewController
            destVC.measurements = remainingMeasurements
            destVC.popoverPresentationController?.delegate = self
            destVC.delegate = self
            let contentHeight = 44.0 * CGFloat(remainingMeasurements.count)
            destVC.preferredContentSize = CGSizeMake(200.0, contentHeight)
        }
    }
    

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return visibleValues.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("MeasurementCell", forIndexPath: indexPath) as! MeasurementCell

        // Move the value string from popover tableView to MeasurementTV and display
        let valueString = visibleValues[indexPath.row]
        cell.measurementLabel.text = valueString
        
        // Pull up the keyboard for the dataTextField, capture the text
        cell.dataTextField.becomeFirstResponder()

        let inputString = cell.dataTextField.text
        
        // TODO: capture input in textField and set as value to appropriate key
        valueDictionary[valueString] = inputString

        return cell
    }

    
    // MARK: - UIPopover Presentation Controller Delegate
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle
    {
        return .None
    }
    
    // MARK: - CharacterListTableViewController Delegate
    
    func measureWasChosen(chosenMeasurement: String)
    {
        navigationController?.dismissViewControllerAnimated(true, completion: nil)
        visibleValues.append(chosenMeasurement)
        
        let rowToRemove = (remainingMeasurements as NSArray).indexOfObject(chosenMeasurement)
        remainingMeasurements.removeAtIndex(rowToRemove)
        
        if remainingMeasurements.count == 2
        {
            addButton.enabled = false
        }
        
        tableView?.reloadData()
    }
    
    // MARK: - Action Handler
    
    
    
    @IBAction func calculateButton(sender: UIButton)
    {
        instructionLabel.text = "Your results are: "
        
        // TODO: pass values to calculator and get results
        valueDictionary = calculator!.calculate(valueDictionary)

        // TODO: display results

        allValues.append(valueDictionary["Amps"]!)
        allValues.append(valueDictionary["Ohms"]!)
        allValues.append(valueDictionary["Volts"]!)
        allValues.append(valueDictionary["Watts"]!)
        
        tableView.reloadData()

    }
    
    @IBAction func clearButtonTapped(sender: UIBarButtonItem)
    {
        remainingMeasurements = allMeasurements
        visibleValues.removeAll()
        addButton.enabled = true
        tableView.reloadData()
        instructionLabel.text = "Add two values to calculate: "
    }
    
    // MARK: - UITestField Delegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        var rc = false
        
        if textField != ""
        {
            rc = true
//            let contentView = textField.superview
//            let cell = contentView?.superview as! MeasurementCell
//            let indexPath = tableView.indexPathForCell(cell)
//            let valueString = visibleValues[indexPath!.row]
//            let inputString = cell.dataTextField.text
//            textField.text = inputString
            
//            // save the key, value pair into the valueDictionary
//            valueDictionary[valueString] = inputString
            
            textField.resignFirstResponder()


        }
        return rc
    }
    
}