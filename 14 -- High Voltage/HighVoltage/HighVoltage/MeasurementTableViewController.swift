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
    var valuesToCalculateDictionary = [String: String]()
    var visibleUnits = Array<String>()
    var visibleValues = Array<String>()
    var remainingUnits = ["Amps","Ohms","Volts","Watts"]
    var allUnits = ["Amps","Ohms","Volts","Watts"]
    var calculator: Calculator!
    
    @IBOutlet weak var addButton: UIBarButtonItem!
    @IBOutlet weak var instructionLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "⚡️ High Voltage ⚡️"
        instructionLabel.text = "ADD(+) TWO VALUES TO CALCULATE"
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
        let unitString = visibleUnits[indexPath.row]
        
        cell.measurementLabel.text = unitString
        cell.dataTextField.delegate = self
        
        if cell.dataTextField.text == "" 
        {
            cell.dataTextField.becomeFirstResponder()
        }
        
        if visibleValues.count == 4
        {
            let valueString = visibleValues[indexPath.row]
            cell.dataTextField.text = valueString
            // FIXME: not resigning
            resignFirstResponder()
            // below causes error: no index path for table cell being reused
//            cell.dataTextField.userInteractionEnabled = false
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
        let unitString = visibleUnits[indexPath!.row]
               
        if textField.text != ""
        {
            rc = true
            textField.resignFirstResponder()
            
            // save the key, value pair into the valueDictionary
            valuesToCalculateDictionary[unitString] = textField.text
        }
        
        if valuesToCalculateDictionary.count == 2
        {
            calculate()
        }
        
        tableView.reloadData()
        return rc
    }
    
    // MARK: - Action Handler
    
    func calculate()
    {
        instructionLabel.text = "RESULTS:"
        
        // pass values to calculator and get results
        calculator = Calculator(dictionary: valuesToCalculateDictionary)
        let resultDictionary = calculator.calculate(valuesToCalculateDictionary)

        visibleUnits.removeAll()
        
        for (key,value) in resultDictionary
        {
            visibleUnits.append(key)
            visibleValues.append(value)
        }
    }
    
    @IBAction func clearButtonTapped(sender: UIBarButtonItem)
    {
        // FIXME: last value entered is persisting in text field, but not recognized by Responder
        calculator.clearCalculator()
        remainingUnits = allUnits
        visibleUnits.removeAll()
        visibleValues.removeAll()
        valuesToCalculateDictionary.removeAll()
        addButton.enabled = true
        instructionLabel.text = "ADD(+) TWO VALUES TO CALCULATE"
        tableView.reloadData()
    }
    
    
}