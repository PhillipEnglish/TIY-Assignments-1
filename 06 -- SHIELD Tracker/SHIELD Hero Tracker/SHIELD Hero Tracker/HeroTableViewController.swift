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
        
        // source: http://sketchytech.blogspot.com/2015/06/swift-getting-sorted.html
        
        // Configure the cell...
        let aHero = heroes[indexPath.row]
        cell.textLabel?.text = aHero.name
        cell.detailTextLabel?.text = aHero.homeworld
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let hero = heroes[indexPath.row]
        let vc = storyboard?.instantiateViewControllerWithIdentifier("HeroDetailViewController") as! HeroDetailViewController
        vc.aHero = hero
        navigationController?.presentViewController(vc, animated: true, completion: nil)
    }

    // MARK: - Private Functions
    
    private func loadHeroes()
    {
        do
        {
            let filePath = NSBundle.mainBundle().pathForResource("heroes", ofType: "json")
            let dataFromFile = NSData(contentsOfFile: filePath!)
            let heroData: NSArray! = try NSJSONSerialization.JSONObjectWithData(dataFromFile!, options: []) as! NSArray
            for heroDictionary in heroData
            {
                let aHero = Hero(dictionary: heroDictionary as! NSDictionary)
                heroes.append(aHero)
            }
            heroes.sortInPlace{$0.name < $1.name}
        }
        catch let error as NSError
        {
            print(error)
        }
    }

}
