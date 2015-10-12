
//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Jennifer Hamilton on 10/8/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

// @objc protocol <- used when you make your own delegate. delegates are used to link, or grab data, from another class
// protocol is more flexible, less restrictive than a class, but holds some of the same properties

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
        setPresentTime()
        updateUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "ShowDatePickerSegue"
        {
            // find out what is on the other side of the segue
            let datePickerVC = segue.destinationViewController
                // 'as!' casts to DatePickerViewController, allowing the use of 'delegate' 
                as! DatePickerViewController
            datePickerVC.delegate = self
        }
    }
    
    // MARK: - DatePicker Delegate
    
    func destinationDateWasChosen(dateChosen: NSDate)
    {
        // passing data from DatePicker class to current class when the "Back" button is selected
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
    
    private func setPresentTime()
    {
        presentTimeLabel.text = dateFormatter.stringFromDate(NSDate())
    }
    
    private func startTimer()
    {
        if timer == nil
        {
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "updateUI", userInfo: nil, repeats: true)
        }
        else
        {
            stopTimer()
        }
    }
    
    private func stopTimer()
    {
        timer?.invalidate()
        timer = nil
        speedLabel.text = "\(currentSpeed - 1) MPH"
    }
    
    private func setLastTimeDeparted()
    {
        lastTimeDepartedLabel.text = destinationTimeLabel.text
    }
    
    func updateUI()
    {
        let newCount = currentSpeed
        currentSpeed = Int(newCount) + 1
        speedLabel.text = String(newCount) + " MPH"
        
        if newCount == 88
        {
            stopTimer()
            setLastTimeDeparted()
            currentSpeed = 0
            speedLabel.text = String(currentSpeed)
        }
    }
}









