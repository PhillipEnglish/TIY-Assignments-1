//
//  PopoverAddLocationsViewController.swift
//  MuttCutts
//
//  Created by Jennifer Hamilton on 10/28/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class PopoverAddLocationsViewController: UIViewController, UITextFieldDelegate
{
    var locations = Array<String>()
    var delegate: PopoverAddLocationsViewControllerDelegate?

    @IBOutlet weak var fromTextField: UITextField!
    @IBOutlet weak var toTextField: UITextField!
    
    
    
    var from: String?
    var to: String?

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        title = "Enter Locations:"
        fromTextField.becomeFirstResponder()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        
        var rc = false
        
        if fromTextField.text != ""
        {
            from = textField.text
//            let from = textField.text
//            locations.append(from!)
            
            if toTextField.text != ""
            {
                to = textField.text
//                let to = textField.text
//                locations.append(to!)
                textField.resignFirstResponder()
                rc = true
            }
        }
        
        delegate?.locationsWereSelected(from!, to: to!)
        
        return rc
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
