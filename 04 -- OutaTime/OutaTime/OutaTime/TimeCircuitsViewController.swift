
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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // useful source: http://www.codingexplorer.com/swiftly-getting-human-readable-date-nsdateformatter/
        dateFormatter.dateFormat = NSDateFormatter.dateFormatFromTemplate("MMM dd yyyy", options: 0, locale: NSLocale(localeIdentifier: "en-US"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet var destinationTimeLabel: UILabel!
    @IBOutlet var presentTimeLabel: UILabel!
    @IBOutlet var lastTimeDepartedLabel: UILabel!
    @IBOutlet var speedLabel: UILabel!
    
    presentTimeLabel.text = dateFormatter(NSDate())
    
    var test = "test"
    test = "help"
    
    var currentSpeed = 0
    speedLabel.text = "\(currentSpeed ) + MPH"
    
    lastTimeDepartedLabel.text = dateFormatter(NSDate())
    
}

