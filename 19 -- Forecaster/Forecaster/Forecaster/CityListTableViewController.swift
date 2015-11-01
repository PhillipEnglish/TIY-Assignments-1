//
//  CityListTableViewController.swift
//  Forecaster
//
//  Created by Jennifer Hamilton on 10/29/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

protocol MapsAPIResultsProtocol
{
    func didReceiveMapsAPIResults(results: NSDictionary)
}

protocol WeatherAPIResultsProtocol
{
    func didReceiveWeatherAPIResults(results: NSDictionary)
}

protocol LocationSearchViewControllerDelegate
{
    func locationWasSelected(zipCode: Int)
}

class CityListTableViewController: UITableViewController, MapsAPIResultsProtocol, LocationSearchViewControllerDelegate, UIPopoverPresentationControllerDelegate, WeatherAPIResultsProtocol
{
    var cities = [City]()
    var mapsAPI: MapsAPIController!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
        tableView.backgroundView = UIImageView(image: UIImage(named: "no-cities-background"))
        
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
        
        cell.cityLabel.text = aCity.name
        cell.currentTempLabel.text = "--°F"
        cell.summaryLabel.text = ""
        if aCity.currentWeather != nil
        {
            cell.currentTempLabel.text = String(Int(aCity.currentWeather!.temperature)) + "°F"
            cell.summaryLabel.text = String(aCity.currentWeather!.summary)
            // FIXME: icon not showing
            cell.iconImage.image = UIImage(named: "\(aCity.currentWeather!.icon).png")
            
        }

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        let selectedCity = cities[indexPath.row]
        let cityDetailVC = storyboard?.instantiateViewControllerWithIdentifier("CityDetail") as! CityDetailViewController
        cityDetailVC.city = selectedCity
        navigationController?.pushViewController(cityDetailVC, animated: true)
    }
    

    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "ShowLocationPopoverSegue"
        {
            let locationPopoverVC = segue.destinationViewController as! LocationSearchViewController
            locationPopoverVC.popoverPresentationController?.delegate = self
            locationPopoverVC.delegate = self
            locationPopoverVC.preferredContentSize = CGSizeMake(180.0, 80.0)
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
        tableView.backgroundView = UIImageView(image: UIImage(named: "blank-background"))

        navigationController?.dismissViewControllerAnimated(true, completion: nil)

        self.mapsAPI = MapsAPIController(cityDelegate: self)
        
        let zipCodeArray = [zipCode]
        for zipCode in zipCodeArray
        {
            mapsAPI.searchGMapsFor(zipCode)
        }

        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    }
    
    
    // MARK: - API Controller Protocols
    
    func didReceiveMapsAPIResults(results: NSDictionary)
    {
        dispatch_async(dispatch_get_main_queue(), {
            
            let aCity = City.cityWithJSON(results)
            self.cities.append(aCity)
            
            let weatherAPI = WeatherAPIController(weatherDelegate: self)
            weatherAPI.searchForecastFor(aCity.lat!, lng: aCity.lng!)
            
            self.tableView.reloadData()
        })
        
    }
    
    func didReceiveWeatherAPIResults(results: NSDictionary)
    {
        dispatch_async(dispatch_get_main_queue(), {
            let weather = Weather.weatherWithJSON(results)
            
            for var aCity in self.cities
            {
                if weather.latitude == aCity.lat
                {
                    aCity.currentWeather = weather as Weather!
                    let cityCopy = aCity
                    self.cities.popLast()
                    self.cities.append(cityCopy)
                }
            }
            self.tableView.reloadData()
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        })
    }
    


    

    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            cities.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            tableView.reloadData()
            
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }


}
