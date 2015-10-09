//
//  TimePickerViewController.swift
//  OutaTime
//
//  Created by Jennifer Hamilton on 10/8/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit


class TimePickerViewController: UIViewController
{
    @IBOutlet var picker: UIDatePicker!
    // delegate property here. this is the 'sending' class
    var delegate: TimerPickerDelegate? //question mark means 'optional'
    
    //    let cities = ["Orlando", "Winter Perk", "Longwood", "Maitland"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillDisappear(animated: Bool)
    {
        super.viewWillDisappear(animated)
        delegate?.timerWasChosen(01010101/*this should be data sent to timecircuits*/)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func datePickerView(pickerView: UIDatePicker) ->String
//    {
//        return pickerView
//    }
    
//    func numberOfComponentsInPickerView(pickerView: UIDatePicker) -> Int
//    {
//        // number of wheels (horizontally) in view
//        return 1
//    }
//    
//    func pickerView(pickerView: UIDatePicker, numberOfRowsInComponent component: Int) -> Int
//    {
//        // sets number of rows, for each picker (as identified by component)
//        //        return cities.count
//        return 60
//    }
//    
//    func pickerView(pickerView: UIDatePicker, titleForRow row: Int /*this is the index of the array/set of data */, forComponent component: Int) -> String?
//    {
//        // func for the delegate, passing the number of the row as the row title
//        //        return "\(cities[row])"
//        return "\(60-row)"
//    }
}