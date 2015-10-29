//
//  ViewController.swift
//  Forecaster
//
//  Created by Jennifer Hamilton on 10/29/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class LocationSearchViewController: UIViewController, UITextFieldDelegate
{
    @IBOutlet weak var zipTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
    var delegate: LocationSearchViewControllerDelegate?
    var location: String = ""
    var zipCode: String = ""

    override func viewDidLoad()
    {
        super.viewDidLoad()
        zipTextField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }

    // MARK: - UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        var rc = false
        
        if zipTextField.text != ""
        {
            zipCode = textField.text!
            textField.resignFirstResponder()
            rc = true
        }
        
        delegate?.locationWasSelected(Int(zipCode)!)
        
        return rc
    }
}

