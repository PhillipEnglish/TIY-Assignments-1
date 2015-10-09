
//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Jennifer Hamilton on 10/8/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

// @objc protocol <- used when you make your own delegate. delegates are used to link, or grab data, from another class

// delegate created in this class, it will be sent from the receiving class

@objc protocol DatePickerDelegate
{
    func destinationDateWasChosen(dateChosen: NSDate)
}

class TimeCircuitsViewController: UIViewController, DatePickerDelegate
{
    let dateFormatter = NSDateFormatter()
    
    @IBOutlet var destinationTimeLabel: UILabel!
    @IBOutlet var presentTimeLabel: UILabel!
    @IBOutlet var lastTimeDepartedLabel: UILabel!
    @IBOutlet var speedLabel: UILabel!
    @IBOutlet var setTimeButton: UIButton!
    @IBOutlet var travelBackButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // useful source: http://www.codingexplorer.com/swiftly-getting-human-readable-date-nsdateformatter/
        dateFormatter.dateFormat = NSDateFormatter.dateFormatFromTemplate("MMM dd yyyy", options: 0, locale: NSLocale(localeIdentifier: "en-US"))
        setPresentTime()
        setCurrentSpeed()
        setLastTimeDeparted()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "ShowDatePickerSegue"
        {
            let datePickerVC = segue.destinationViewController
                as! DatePickerViewController
            datePickerVC.delegate = self
        }
    }
    
    // MARK: - DatePicker Delegate
    
    func destinationDateWasChosen(dateChosen: NSDate)
    {
        // passing data from DatePicker class to current class when the "Back" button is selected
        destinationTimeLabel.text = "not yet" 
        destinationTimeLabel.text = dateFormatter.stringFromDate(dateChosen)
    }
    
    // MARK: - Action Handlers
    
    
    @IBAction func destinationButtonTapped(sender: UIButton)
    {
        
    }
    
    
    // MARK: - Private
    
    private func setPresentTime()
    {
        presentTimeLabel.text = dateFormatter.stringFromDate(NSDate())
    }
    
    private func setCurrentSpeed()
    {
        let currentSpeed = 88
        speedLabel.text = "\(currentSpeed) MPH"
    }
    
    private func setLastTimeDeparted()
    {
        lastTimeDepartedLabel.text = dateFormatter.stringFromDate(NSDate())
    }
   
    
}









