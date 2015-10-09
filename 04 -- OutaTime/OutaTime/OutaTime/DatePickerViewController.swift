//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Jennifer Hamilton on 10/8/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit


class DatePickerViewController: UIViewController
{
    @IBOutlet var picker: UIDatePicker!
    // delegate property here. this is the 'sending' class
    var delegate: DatePickerDelegate? //question mark means 'optional'
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillDisappear(animated: Bool)
    {
        super.viewWillDisappear(animated)
        delegate?.destinationDateWasChosen(picker.date)/*this should be data sent to timecircuits*/
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}