//
//  ViewController.swift
//  MissionBriefing
//
//  Created by Jennifer Hamilton on 10/7/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//
import UIKit

class MissionBriefingViewController: UIViewController, UITextFieldDelegate
{
    // Place IBOutlet properties below
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var authenticateButton: UIButton!
    @IBOutlet var greetingLabel: UILabel!
    @IBOutlet var missionTextField: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //
        // 3. The three UI elements need to be emptied on launch
        //    Hint: there is a string literal that represents empty
        //
        nameTextField.text = ""
        passwordTextField.text = ""
        greetingLabel.text = ""
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Action Handlers
    
    @IBAction func authenticateAgent(sender: UIButton)
    {
        // This will cause the keyboard to dismiss when the authenticate button is tapped
        if authenticateButton.isFirstResponder()
        {
            authenticateButton.resignFirstResponder()
        }
        
        
        // 4. Check whether there is text in BOTH the name and password textfields
        //
        if nameTextField.text != "" && passwordTextField.text != ""
        {
            greetAgent()
            
            //
            // 6. The mission briefing textview needs to be populated with the briefing from HQ, but it must also include the last
            //    name of the agent that logged in. Perhaps you could use the text in the textfield to get the agent's last name.
            //    How would you inject that last name into the paragraph of the mission briefing?
            //    Set the textview text property to the paragraph in "MissionBriefing.txt"
            //
            
            missionTextField = "This mission will be an arduous one, fraught with peril. You will cover much strange and unfamiliar territory. Should you choose to accept this mission, Agent \(nameComponent), you will certainly be disavowed, but you will be doing your country a great service. This message will self destruct in 5 seconds."
            
            
            
            //
            // 7. The view's background color needs to switch to green to indicate a successful login by the agent.
            //
            //    The color's RGB value is Red: 0.585, Green: 0.78, Blue: 0.188 with an alpha of 1. There is a class method on the
            //    UIColor class that returns a color object with custom defined RGBA values. Open the documentation and look for a
            //    method on UIColor that can take red, green, blue and alpha values as arguments.
            //
            //    Once you have the color object, you should be able to set the view's background color to this object.
            //
            
            
            
            
            
            
        }
        else
        {
            //
            // 8. The view's background color needs to switch to red to indicate a failed login by the agent.
            //
            //    The color's RGB value is Red: 0.78, Green: 0.188, Blue: 0.188 with an alpha of 1. There is a class method on the
            //    UIColor class that returns a color object with custom defined RGBA values. Open the documentation and look for a
            //    method on UIColor that can take red, green, blue and alpha values as arguments.
            //
            //    Once you have the color object, you should be able to set the view's background color to this object.
            //
            
            
            
            
            
            
        }
    }
    
    // MARK: - UITextField Delegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        return greetAgent()
    }

    // MARK: - Private
    
    func greetAgent() -> Bool
    {
        
        //
        // 5. The greeting label needs to be populated with the the string "Good evening, Agent #", where # is the last name of
        //    the agent logging in. The agent's full name is listed in the text field, but you need to pull out just the last
        //    name. Open the Apple Documentation and go to the page for NSString. There is a section in the left called "Dividing
        //    Strings". You should be able to find a method that allows you to break up a string using a delimiter. In our case,
        //    the delimiter would be a space character.
        //

        var rc = false
        
        if let name = nameTextField.text
        {
            rc = true
            nameTextField.resignFirstResponder()
            let nameComponents = name.characters.split(" ").map { String($0) }
            greetingLabel.text = "Good eventing, Agent \(nameComponents[1])"
        }
        
        return rc
    }

}



