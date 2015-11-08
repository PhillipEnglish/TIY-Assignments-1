//
//  ToDoTableViewController.swift
//  InDueTime
//
//  Created by Jennifer Hamilton on 10/20/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController, UITextFieldDelegate
{
    var toDos = [PFObject]()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool)
    {
        super.viewDidAppear(animated)
        navigationItem.leftBarButtonItem = editButtonItem()
        refreshList()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDos.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ToDoCell", forIndexPath: indexPath) as! ToDoCell
        cell.todoTextField.text = ""
        // get the counter at the relevant row
        let anItem = toDos[indexPath.row]
        if let itemDescription = anItem["itemDescription"] as? String
        {
            if itemDescription == ""
            {
                cell.todoTextField.becomeFirstResponder()
            }
            else
            {
                cell.todoTextField.text = itemDescription
            }
        }
        else
        {
            cell.todoTextField.becomeFirstResponder()
        }
        
        if let isComplete = anItem["isComplete"] as? Bool
        {
            if isComplete == false
            {
                cell.checkbox.setImage(UIImage(named: "unchecked.png"), forState: UIControlState.Normal)

            }
            else
            {
                cell.checkbox.setImage(UIImage(named: "checked.png"), forState: UIControlState.Normal)
            }
        }
        
        return cell
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        // Return false if you do not want the specified item to be editable.


        return true
    }
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {

        if editingStyle == .Delete
        {
            // Delete the row from the data source
            let anItem = toDos[indexPath.row]
            if let isComplete = anItem["isComplete"] as? Bool
            {
                if isComplete == true
                {
                    toDos.removeAtIndex(indexPath.row)
                    anItem.deleteInBackground()
                    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
                    refreshList()

                }
            }
        }
    }
    
    // MARK: - Parse Queries
    
    func refreshList()
    {
        
        let query = PFQuery(className: "ToDoItem")
        query.findObjectsInBackgroundWithBlock
            {
                (objects: [PFObject]?, error: NSError?) -> Void in
                if error == nil
                {
                    self.toDos = objects!.reverse()
                    self.tableView.reloadData()
                }
                else
                {
                    print(error?.localizedDescription)
                }
        }
        
    }
    
    // MARK: - Text Field Delegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        var rc = false
        
        if textField != ""
        {
            rc = true
            let contentView = textField.superview
            let cell = contentView?.superview as! ToDoCell
            let indexPath = tableView.indexPathForCell(cell)
            let anItem = toDos[indexPath!.row]
            anItem["itemDescription"] = textField.text!
            anItem.saveInBackgroundWithBlock
                {
                    (succeeded: Bool, error: NSError?) -> Void in
                    if succeeded
                    {
                        // object was saved to Parse
                    }
                    else
                    {
                        print(error?.localizedDescription)
                    }
            }

            textField.resignFirstResponder()
        }
        return rc
    }
    
    // MARK: - Action Handlers
    
    @IBAction func addToDoItem(sender: UIBarButtonItem)
    {
        // FIXME: when item deleted from TVC and + pressed, new item is a copy of deleted item, causing errors
        let anItem = PFObject(className: "ToDoItem")
//        anItem["itemDescription"] = ""
        anItem["isComplete"] = false
        toDos.insert(anItem, atIndex: 0)
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }
    
    @IBAction func checkboxTapped(sender: UIButton)
    {
        // TODO: displaying correctly, but not sending to Parse correctly
        let contentView = sender.superview
        let cell = contentView?.superview as! ToDoCell
        let indexPath = tableView.indexPathForCell(cell)
        let anItem = toDos[indexPath!.row]
        
        if sender.currentImage == UIImage(named: "unchecked.png")
        {
            cell.checkbox.setImage(UIImage(named: "checked.png"), forState: UIControlState.Normal)
            anItem["isComplete"] = true
        }
        else
        {
            cell.checkbox.setImage(UIImage(named: "unchecked.png"), forState: UIControlState.Normal)
            anItem["isComplete"] = false
        }
        anItem.saveInBackground()
    }
}
