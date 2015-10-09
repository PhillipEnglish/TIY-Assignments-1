
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

@objc protocol TimerPickerDelegate
{
    func timerWasChosen(timerCount: Int)
}

class TimeCircuitsViewController: UIViewController, TimerPickerDelegate
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
        if segue.identifier == "ShowTimePickerSegue"
        {
            let timerPickerVC = segue.destinationViewController
                as! TimePickerViewController
            timerPickerVC.delegate = self
        }
    }
    
    // MARK: - TimerPicker Delegate
    
    func timerWasChosen(timerCount: Int)
    {
        // passing data from TimerPicker class to current class when the "Back" button is selected
        destinationTimeLabel.text = "\(timerCount)"
    }
    
    func setPresentTime()
    {
        presentTimeLabel.text = dateFormatter.stringFromDate(NSDate())

    }
    
    
    func setCurrentSpeed()
    {
        let currentSpeed = 88
        speedLabel.text = "\(currentSpeed) MPH"
    }
    
    func setLastTimeDeparted()
    {
        lastTimeDepartedLabel.text = dateFormatter.stringFromDate(NSDate())
    }
   
    
}









