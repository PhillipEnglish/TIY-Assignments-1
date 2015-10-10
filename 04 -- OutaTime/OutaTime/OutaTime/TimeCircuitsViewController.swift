
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
    
    var timer: NSTimer?
    var currentSpeed: Int = 0
    var lastTimeDeparted: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // useful source: http://www.codingexplorer.com/swiftly-getting-human-readable-date-nsdateformatter/
        dateFormatter.dateFormat = NSDateFormatter.dateFormatFromTemplate("MMM dd yyyy", options: 0, locale: NSLocale(localeIdentifier: "en-US"))
        updateUI()
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
    
    @IBAction func travelBackButtonTapped(sender: UIButton)
    {
        startTimer()
    }
    
    // MARK: - Private
    
    private func setLastTimeDeparted()
    {
        
        presentTimeLabel.text = dateFormatter.stringFromDate(NSDate())
        lastTimeDeparted = String(destinationTimeLabel)
    }
    
    private func startTimer()
    {
        if timer == nil
        {
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "updateUI", userInfo: nil, repeats: true)
//            travelBackButton.setTitle("BRAKE", forState: UIControlState.Normal)
        }
        else
        {
//            travelBackButton.setTitle("START", forState: UIControlState.Normal)
            stopTimer()
        }
    }
    
    private func stopTimer()
    {
        timer?.invalidate()
        timer = nil
        setLastTimeDeparted()
        speedLabel.text = "0 MPH"
    }
    
    func updateUI()
    {
        let newCount = currentSpeed + 1
        currentSpeed = newCount
        speedLabel.text = String(newCount) + " MPH"
        
        if newCount == 88
        {
            stopTimer()
            setLastTimeDeparted()
        }
        
    }
    
}









