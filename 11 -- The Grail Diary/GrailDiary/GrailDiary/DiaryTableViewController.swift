//
//  DiaryTableViewController.swift
//  GrailDiary
//
//  Created by Jennifer Hamilton on 10/19/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class DiaryTableViewController: UITableViewController {

    var sites = Array<Sites>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "The Grail Diary"
        loadSites()

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
        return sites.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("CustomCell", forIndexPath: indexPath) as! CustomCell
        
        let aSite = sites[indexPath.row]
        cell.nameLabel.text = aSite.name
        cell.locationLabel.text = aSite.location
        cell.circaLabel.text = "Circa: \(aSite.circa)"
        cell.descriptionLabel.text = "Further Details: \(aSite.description)"
        cell.imageView!.image = UIImage(named: aSite.siteImage)
        
        return cell
    }
    
    // MARK: - Private
    
    private func loadSites()
    {
        do
        {
            let filePath = NSBundle.mainBundle().pathForResource("sites", ofType: "json")
            let dataFromFile = NSData(contentsOfFile: filePath!)
            let siteData: NSArray! = try NSJSONSerialization.JSONObjectWithData(dataFromFile!, options: []) as! NSArray
            for siteDictionary in siteData
            {
                let aSite = Sites(dictionary: siteDictionary as! NSDictionary)
                sites.append(aSite)
            }
            sites.sortInPlace{$0.name < $1.name}
        }
        catch let error as NSError
        {
            print(error)
        }
    }

}
