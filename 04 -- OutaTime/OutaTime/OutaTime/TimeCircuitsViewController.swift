
//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Jennifer Hamilton on 10/8/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController 
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









