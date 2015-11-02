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
    @IBOutlet weak var alertLabel: UILabel!

    var delegate: LocationSearchViewControllerDelegate?
    var location: String = ""
    var zipCode: String = ""

    override func viewDidLoad()
    {
    super.viewDidLoad()
    alertLabel.text = ""
    alertLabel.textColor = UIColor.redColor()
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
        // TODO: validate zipcode input

        if zipTextField.text != ""
        {
//            if validateZipCode(textField.text!)
//            {
//                alertLabel.text = ""
                zipCode = textField.text!
                textField.resignFirstResponder()
                rc = true

//            }
//            else
//            {
//                textField.text = ""
//                textField.becomeFirstResponder()
//                alertLabel.text = "Invalid Entry!"
//            }
        }

        delegate?.locationWasSelected(Int(zipCode)!)
        return rc
    }

    func validateZipCode(zip: String) -> Bool
    {
        let characterSet = NSCharacterSet(charactersInString: "0123456789")
        if zip.characters.count == 5 && zip.rangeOfCharacterFromSet(characterSet)?.count == 0
        {
            return true
        }
        else
        {
            return false
        }
    }
}

