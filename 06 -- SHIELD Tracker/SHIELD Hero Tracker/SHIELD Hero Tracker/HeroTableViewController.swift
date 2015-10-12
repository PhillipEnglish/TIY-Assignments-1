//
//  HeroTableViewController.swift
//  SHIELD Hero Tracker
//
//  Created by Jennifer Hamilton on 10/12/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit



class HeroTableViewController: UITableViewController, HeroDetailDelegate
{
    
    //    @IBOutlet var picker: UIDatePicker!
    //    // delegate property here. this is the 'sending' class
    //    var delegate: DatePickerDelegate? //question mark means 'optional' (doesnt' have to have a value)

    var heroes = Array<Hero>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "S.H.I.E.L.D. Hero Tracker"
        
        loadHeroes()
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
    
    // MARK: - Private Functions
    
    private func loadHeroes()
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
            // try/catch is used for catching errors. needed to build, will learn more later
        catch let error as NSError
        {
            print(error)
        }
    }

}
