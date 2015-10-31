//
//  CityListTableViewController.swift
//  Forecaster
//
//  Created by Jennifer Hamilton on 10/29/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

protocol LocationSearchViewControllerDelegate
{
    func locationWasSelected(zipCode: Int)
}

protocol MapsAPIResultsProtocol
{
    func didReceiveMapsAPIResults(results: NSArray)
}

protocol WeatherAPIResultsProtocol
{
    func didReceiveWeatherAPIResults(currently: NSDictionary, city: City)
}

class CityListTableViewController: UITableViewController, MapsAPIResultsProtocol, LocationSearchViewControllerDelegate, UIPopoverPresentationControllerDelegate, WeatherAPIResultsProtocol
{
    var cities = [City]()
    var mapsAPI: MapsAPIController!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
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
        print("city's temp: \(aCity.currentWeather?.temperature)")
        
        cell.cityLabel.text = aCity.name
        cell.currentTempLabel.text = String(aCity.currentWeather!.temperature).componentsSeparatedByString(".")[0]+"°"

        return cell
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
        
        self.mapsAPI = MapsAPIController(cityDelegate: self)
        
        let zipCodes = [zipCode]
        for zipCode in zipCodes
        {
            mapsAPI.searchGMapsFor(zipCode)
        }
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true

//        tableView.reloadData()
    }
    
    // MARK: - API Controller Protocols
    
    func didReceiveMapsAPIResults(results: NSArray)
    {
        dispatch_async(dispatch_get_main_queue(), {
            
            self.dismissViewControllerAnimated(true, completion: nil)
            
            let aCity = City.cityWithJSON(results)
            self.cities.append(aCity)
            
            let weatherAPI = WeatherAPIController(weatherDelegate: self)
            weatherAPI.searchForecastFor(aCity)
            
            self.tableView.reloadData()
        })
        
    }
    
    func didReceiveWeatherAPIResults(results: NSDictionary, city: City)
    {
        dispatch_async(dispatch_get_main_queue(), {
            let weather = Weather.weatherWithJSON(results)
            
            for var aCity in self.cities
            {
                if aCity.lat == city.lat
                    
                {
                    aCity.currentWeather = weather
                    print("city's temp: \(aCity.currentWeather?.temperature)")

                }
                else
                {
                    print("weather is nil")
                }
            }
            self.tableView.reloadData()
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false

        })

        
    }

    
    // TODO: format CityCell with weather data
    // TODO: create DetailVC, connect with delegate and segue
    // TODO: format DetailVC
    // TODO: add map to Detail VC, update with city data
    // TODO: add 7 day forecast data detial view

    
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
