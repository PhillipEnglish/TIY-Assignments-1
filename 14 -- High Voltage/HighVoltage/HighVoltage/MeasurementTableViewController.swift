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

class MeasurementTableViewController: UITableViewController, UIPopoverPresentationControllerDelegate, UITextFieldDelegate, MeasurementListTableViewControllerDelegate
{
    var valueDictionary = [String: String]()
    var visibleUnits = Array<String>()
    var visibleValues = Array<String>()
    var remainingUnits = ["Amps","Ohms","Volts","Watts"]
    var allUnits = ["Amps","Ohms","Volts","Watts"]
//    var allValues = Array<String>()
    
    var calculator: Calculator!
    
    @IBOutlet weak var addButton: UIBarButtonItem!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var instructionLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "⚡️ High Voltage ⚡️"
        instructionLabel.text = "Add two values to calculate: "
        calculateButton.enabled = false
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
            destVC.measurements = remainingUnits
            destVC.popoverPresentationController?.delegate = self
            destVC.delegate = self
            let contentHeight = 44.0 * CGFloat(remainingUnits.count)
            destVC.preferredContentSize = CGSizeMake(200.0, contentHeight)
        }
    }
    

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return visibleUnits.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("MeasurementCell", forIndexPath: indexPath) as! MeasurementCell

        // Move the value string from popover tableView to MeasurementTV and display
        let valueString = visibleUnits[indexPath.row]
        cell.measurementLabel.text = valueString
        
        cell.dataTextField.delegate = self
        
        // Pull up the keyboard for the dataTextField, capture the text
        if cell.dataTextField.text == "" 
        {
            cell.dataTextField.becomeFirstResponder()
        }
        
        // TODO:  calculateButton.enable == true only when 2 values input
        if visibleUnits.count == 2
        {
            calculateButton.enabled = true
        }
        else
        {
            calculateButton.enabled = false
        }

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
        visibleUnits.append(chosenMeasurement)
        
        let rowToRemove = (remainingUnits as NSArray).indexOfObject(chosenMeasurement)
        remainingUnits.removeAtIndex(rowToRemove)
        
        if remainingUnits.count == 2
        {
            addButton.enabled = false
        }
        
        tableView.reloadData()
    }
    // MARK: - UITestField Delegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        var rc = false
        
        let contentView = textField.superview
        let cell = contentView?.superview as! MeasurementCell
        let indexPath = tableView.indexPathForCell(cell)
        let valueString = visibleUnits[indexPath!.row]
        
        if textField.text != ""
        {
            rc = true
            textField.resignFirstResponder()
            
            // save the key, value pair into the valueDictionary
            valueDictionary[valueString] = textField.text
        }
        
        tableView.reloadData()
        return rc
    }

    
    // MARK: - Action Handler
    
    @IBAction func calculateButton(sender: UIButton)
    {
        instructionLabel.text = "Your results are: "
        
        // pass values to calculator and get results
        let resultDictionary = Calculator(dictionary: valueDictionary).calculate(valueDictionary)
        
        // TODO: display results
        visibleUnits.removeAll()
        
        for (key,value) in resultDictionary
        {
            visibleUnits.append(key)
            visibleValues.append(value)
        }
        
        tableView.reloadData()

    }
    
    @IBAction func clearButtonTapped(sender: UIBarButtonItem)
    {
        remainingUnits = allUnits
        visibleUnits.removeAll()
        addButton.enabled = true
        calculateButton.enabled = false
        tableView.reloadData()
        instructionLabel.text = "Add two values to calculate: "
    }
    
    
}