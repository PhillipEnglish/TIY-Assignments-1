//
//  CityListTableViewController.swift
//  Forecaster
//
//  Created by Jennifer Hamilton on 10/29/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

protocol APIControllerProtocol
{
    func didReceiveAPIResults(results: NSDictionary)
}

protocol LocationSearchViewControllerDelegate
{
    func locationWasSelected(zipCode: Int)
}

class CityListTableViewController: UITableViewController, APIControllerProtocol, LocationSearchViewControllerDelegate, UIPopoverPresentationControllerDelegate
{
    var cities = Array<City>()
    var highLowTemps = Array<String>()
    var icons = Array<String>()
    var currentTemps = Array<String>()
    
    var api: APIController!
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        

    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return cities.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("CityCell", forIndexPath: indexPath) as! CityCell        

        let cityString = cities[indexPath.row]
        let currentTemp = cities[indexPath.row]
        
        cell.cityLabel.text = cityString.name
        cell.currentTempLabel.text = String(currentTemp.lat!)

        return cell
    }
    
    // MARK: - API Controller Protocol
    
    func didReceiveAPIResults(results: NSDictionary)
    {
        dispatch_async(dispatch_get_main_queue(), {
            
            self.cities.append(City.cityWithJSON(results))
            self.tableView.reloadData()
            
            
            // now look for the weather!!!!!!!!!!!!
        })
        
    }

    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "ShowLocationPopoverSegue"
        {
            let destVC = segue.destinationViewController as! LocationSearchViewController
            destVC.popoverPresentationController?.delegate = self
            destVC.delegate = self
            destVC.preferredContentSize = CGSizeMake(200.0, 100.0)
        }
    }
    
    // MARK: - UIPopover Presentation Controller Delegate
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle
    {
        return .None
    }
    
    
    // MARK: - Location Delegate
    func locationWasSelected(zipCode: Int)
    {
        navigationController?.dismissViewControllerAnimated(true, completion: nil)
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true

        api = APIController(delegate: self)
        api.searchGMapsFor(zipCode)
    
        tableView.reloadData()
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false

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

}
