//
//  HeroTableViewController.swift
//  SHIELD Hero Tracker
//
//  Created by Jennifer Hamilton on 10/12/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class HeroTableViewController: UITableViewController {

    var heroes = Array<Hero>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "S.H.I.E.L.D. Hero Tracker"
        
        loadHeroes()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return heroes.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("HeroCell", forIndexPath: indexPath)
        
        // Configure the cell...
        let aHero = heroes[indexPath.row]
        cell.textLabel?.text = aHero.name
        cell.detailTextLabel?.text = aHero.homeworld
        
        return cell
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func loadHeroes()
    {
        do
        {
            // find the bundle that holds the files in the project folder, find the specific file passed to the method
            let filePath = NSBundle.mainBundle().pathForResource("heroes", ofType: "json")
            // pass the data from the file into an NSData object
            let dataFromFile = NSData(contentsOfFile: filePath!)
            // '!' means it's an optional, but I know it will have a value
            // used to convert the data from the file into a usable format for Swift. In this case, we are putting it into an array
            // options: empty array []
            // return as a NSArray
            let heroData: NSArray! = try NSJSONSerialization.JSONObjectWithData(dataFromFile!, options: []) as! NSArray
            for heroDictionary in heroData
            {
                let aHero = Hero(dictionary: heroDictionary as! NSDictionary)
                heroes.append(aHero)
            }
        }
            // try/catch is used for catching errors. needed to run
        catch let error as NSError
        {
            print(error)
        }
    }

}
