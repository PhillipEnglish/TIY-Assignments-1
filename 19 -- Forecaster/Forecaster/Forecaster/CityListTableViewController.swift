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

protocol WeatherResultProtocol
{
    func locationWeatherSearched(results: NSDictionary)
}

protocol LocationSearchViewControllerDelegate
{
    func locationWasSelected(zipCode: Int)
}

class CityListTableViewController: UITableViewController, APIControllerProtocol, LocationSearchViewControllerDelegate, UIPopoverPresentationControllerDelegate, WeatherResultProtocol
{
    var cities = Array<City>()
//    var weatherForCities = Array<Weather>()
//    var highLowTemps = Array<String>()
//    var icons = Array<String>()
//    var currentTemps = Array<String>()
    
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

        let aCity = cities[indexPath.row]
//        let currentTemp = weatherForCities[indexPath.row]
        
        cell.cityLabel.text = aCity.name
//        cell.currentTempLabel.text = String(aCity.currentWeather!.temperature)

        return cell
    }
    
    // MARK: - API Controller Protocols
    
    func didReceiveAPIResults(results: NSDictionary)
    {
        dispatch_async(dispatch_get_main_queue(), {
            
            let aCity = City.cityWithJSON(results)
            self.cities.append(aCity)
            self.api.searchForecastFor(aCity.lat!, lng: aCity.lng!)
            self.tableView.reloadData()
        })
        
    }
    
    func locationWeatherSearched(results: NSDictionary)
    {
        dispatch_async(dispatch_get_main_queue(), {
            let weather = Weather.weatherWithJSON(results)
            
            for var aCity in self.cities
            {
                if weather.latitude == aCity.lat
                {
                    aCity.currentWeather = weather

                }
                else
                {
                    print("weather is nil")
                }

            }

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

        api = APIController(cityDelegate: self)
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

}
