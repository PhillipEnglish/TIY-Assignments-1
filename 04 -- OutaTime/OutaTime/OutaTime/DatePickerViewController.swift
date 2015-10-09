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
    
    //    let cities = ["Orlando", "Winter Perk", "Longwood", "Maitland"]
    
    var dateChosen = "date"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewWillDisappear(animated: Bool)
    {
        super.viewWillDisappear(animated)
        delegate?.destinationDateWasChosen(dateChosen)/*this should be data sent to timecircuits*/
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func selectADate(pickerView: UIDatePicker)
//    {
//        dateChosen = "\(pickerView)"
//    }
    


}

//class TimerPickerViewController: UIViewController, UIPickerViewDataSource
//{
//    @IBOutlet var picker: UIPickerView!
//    // delegate property here. this is the 'sending' class
//    var delegate: TimerPickerDelegate? //question mark means 'optional'
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//    }
//    
//    override func viewWillDisappear(animated: Bool)
//    {
//        super.viewWillDisappear(animated)
//        delegate?.timerWasChosen(60-picker.selectedRowInComponent(0))
//    }
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int
//    {
//        // number of wheels (horizontally) in view
//        return 1
//    }
//    
//    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
//    {
//        // sets number of rows, for each picker (as identified by component)
//        //        return cities.count
//        return 60
//    }
//    
//    func pickerView(pickerView: UIPickerView, titleForRow row: Int /*this is the index of the array/set of data */, forComponent component: Int) -> String?
//    {
//        // func for the delegate, passing the number of the row as the row title
//        return "\(60-row)"
//    }
//}