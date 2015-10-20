//
//  ToDoTableViewController.swift
//  InDueTime
//
//  Created by Jennifer Hamilton on 10/20/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit
import CoreData

class ToDoTableViewController: UITableViewController, UITextFieldDelegate
{
    var toDos = Array<ToDoItem>()
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "ToDo It"
        
        let fetchRequest = NSFetchRequest(entityName: "ToDoItem")
        do {

            let fetchResults = try managedObjectContext.executeFetchRequest(fetchRequest) as? [ToDoItem]

            toDos = fetchResults!
        }
        catch {
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
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

        // get the counter at the relevant row
        let anItem = toDos[indexPath.row]
        if anItem.itemDescription == nil
        {
            cell.todoTextField.becomeFirstResponder()
        }
        else
        {
            cell.todoTextField.text = anItem.itemDescription
        }

        if anItem.isCompleted == false
        {
            cell.checkbox.setImage(UIImage(named: "unchecked.png"), forState: UIControlState.Normal)

        }
        else
        {
            cell.checkbox.setImage(UIImage(named: "checked.png"), forState: UIControlState.Normal)
        }

        return cell
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete
        {
            // Delete the row from the data source
            let anItem = toDos[indexPath.row]
            if anItem.isCompleted
            {
                toDos.removeAtIndex(indexPath.row)
                managedObjectContext.deleteObject(anItem)
            }
            saveContext()
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
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
            anItem.itemDescription = textField.text
            textField.resignFirstResponder()
            saveContext()
        }
        return rc
    }
    
    // MARK: - Action Handlers
    
    @IBAction func addToDoItem(sender: UIBarButtonItem)
    {
        let aToDoItem = NSEntityDescription.insertNewObjectForEntityForName("ToDoItem", inManagedObjectContext: managedObjectContext) as! ToDoItem
        // add to array
        
        toDos.append(aToDoItem)
        // reload the view
        tableView.reloadData()
    }
    
    @IBAction func checkboxTapped(sender: UIButton)
    {
        let contentView = sender.superview
        let cell = contentView?.superview as! ToDoCell
        let indexPath = tableView.indexPathForCell(cell)
        let anItem = toDos[indexPath!.row]
        // if enabled, item is true, item is complete and can be deleted
        // send it to db
        
        if sender.currentImage == UIImage(named: "unchecked.png")
        {
            cell.checkbox.setImage(UIImage(named: "checked.png"), forState: UIControlState.Normal)
            anItem.isCompleted = true
        }
        else
        {
            cell.checkbox.setImage(UIImage(named: "unchecked.png"), forState: UIControlState.Normal)
            anItem.isCompleted = false
        }
        
        saveContext()
    }

    // MARK: - Private Functions
    
    private func saveContext()
    {
        do
        {
            try managedObjectContext.save()
        }
        catch
        {
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
    }
    
}
