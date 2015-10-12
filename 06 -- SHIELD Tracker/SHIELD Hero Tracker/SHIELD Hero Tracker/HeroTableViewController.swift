//
//  HeroTableViewController.swift
//  SHIELD Hero Tracker
//
//  Created by Jennifer Hamilton on 10/12/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit



class HeroTableViewController: UITableViewController
{
    @IBOutlet weak var heroSelection: UITableViewCell!
    var delegate: HeroPickerDelegate?
    
    var heroes = Array<Hero>()
    
   override func viewDidLoad() {
        super.viewDidLoad()
        title = "S.H.I.E.L.D. Hero Tracker"
        loadHeroes()
    }
    
    override func viewWillDisappear(animated: Bool)
    {
        super.viewWillDisappear(animated)
        // '?' means only run if delegate has a value
        delegate?.didSelectRowAtIndexPath(UITableViewCell)
        /*this should be data sent to timecircuits*/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "ShowHeroDetailSegue"
        {
            // find out what is on the other side of the segue
            let heroPickerVC = segue.destinationViewController
                // 'as!' casts to DatePickerViewController, allowing the use of 'delegate'
                as! HeroDetailViewController
            heroPickerVC.delegate = self
        }
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
        
        // source: http://sketchytech.blogspot.com/2015/06/swift-getting-sorted.html
        heroes.sortInPlace{$0.name < $1.name}
        // Configure the cell...
        let aHero = heroes[indexPath.row]
        cell.textLabel?.text = aHero.name
        cell.detailTextLabel?.text = aHero.homeworld
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let row = heroes[indexPath.row]
        let vc = storyboard?.instantiateViewControllerWithIdentifier("HeroDetailViewController") as! HeroDetailViewController
        presentViewController(vc, animated: true, completion: nil)
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
            // try/catch is used for catching errors. needed to run
        catch let error as NSError
        {
            print(error)
        }
    }

}
