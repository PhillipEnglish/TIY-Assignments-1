//
//  ViewController.swift
//  SayMyName
//
//  Created by Jennifer Hamilton on 10/7/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class NameViewController: UIViewController, UITextFieldDelegate
{
    
    // IBOutlets go here
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var messageLabel: UILabel!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        messageLabel.text = ""
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Action Handlers
    
    @IBAction func switchValueChanged(sender: UISwitch)
    {
        if sender.on
        {
            view.backgroundColor = UIColor.greenColor()
        }
        else
        {
            view.backgroundColor = UIColor.whiteColor()
        }
    }
    
    @IBAction func goTapped(sender: UIButton)
    {
        sayHello()
    }
    
    // MARK: - UITestField Delegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        return sayHello()
    }
    
    // MARK: - Private
    
    func sayHello() -> Bool
    {
        var rc = false
        
        if let name = nameTextField.text
        {
            rc = true
            nameTextField.resignFirstResponder()
            let nameComponents = name.characters.split(" ").map { String($0) }
            messageLabel.text = "Hello, \((nameComponents[0]).capitalizedString)"
        }

        return rc
    }


    
}

