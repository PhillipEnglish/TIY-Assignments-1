//
//  ViewController.swift
//  MissionBriefing
//
//  Created by Jennifer Hamilton on 10/7/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//
import UIKit

class MissionBriefingViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate
{
    // Place IBOutlet properties below
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var authenticateButton: UIButton!
    @IBOutlet var greetingLabel: UILabel!
    @IBOutlet var missionTextView: UITextView!
    
    
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
//        missionTextView.text = ""
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Action Handlers
    @IBAction func buttonTapped(sender: UIButton)
    {
        authenticateAgent()
    }
    
    // MARK: - UITextField Delegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        return authenticateAgent()
    }
    
    // MARK: - UITextView Delegate
    
    func textViewShouldReturn(textView: UITextView) -> Bool
    {
        return authenticateAgent()
    }

    
    // MARK: - Private
    
    func authenticateAgent() -> Bool
    {
        var rc = false
        
        if nameTextField.text != ""
        {
            let name = nameTextField.text
            
            // #4
            if passwordTextField.text != ""
            {
                rc = true
                nameTextField.resignFirstResponder()
                let nameComponents = name!.characters.split(" ").map { String($0) }
                let lastName = nameComponents[1].capitalizedString
                // #5
                greetingLabel.text = "Good evening, Agent \(lastName)"
                // #6 TODO not working
//                missionTextView.text = "This mission will be an arduous one, fraught with peril. You will cover much strange and unfamiliar territory. Should you choose to accept this mission, Agent \(lastName), you will certainly be disavowed, but you will be doing your country a great service. This message will self destruct in 5 seconds."
                // #7
                view.backgroundColor = UIColor(red: 0.585, green: 0.78, blue: 0.188, alpha: 1.0)
            }
            else
            {
                greetingLabel.text = "Please enter your password."
                agentFailureToAuthenticate()
            }
        }
        else
        {
            // #8
            greetingLabel.text = "Please enter your agent name."
            agentFailureToAuthenticate()
        }
        
        return rc
    }
    
    func agentFailureToAuthenticate()
    {
        view.backgroundColor = UIColor(red: 0.78, green: 0.188, blue: 0.188, alpha: 1.0)
    }
}


// 6. The mission briefing textview needs to be populated with the briefing from HQ, but it must also include the last
//    name of the agent that logged in. Perhaps you could use the text in the textfield to get the agent's last name.
//    How would you inject that last name into the paragraph of the mission briefing?
            