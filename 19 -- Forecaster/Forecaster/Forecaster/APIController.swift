//
//  APIController.swift
//  Forecaster
//
//  Created by Jennifer Hamilton on 10/29/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

class APIController
{
    var cityDelegate: APIControllerProtocol?
    var weatherDelegate: WeatherResultProtocol?
    
    init(cityDelegate: APIControllerProtocol)
    {
        self.cityDelegate = cityDelegate
    }
    
    init(weatherDelegate: WeatherResultProtocol)
    {
        self.weatherDelegate = weatherDelegate
    }
    
    func searchGMapsFor(searchTerm: Int)
    {
        let url = NSURL(string: "https://maps.googleapis.com/maps/api/geocode/json?address=santa+cruz&components=postal_code:\(searchTerm)&sensor=false")
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url!, completionHandler: {data, response, error -> Void in
            if error != nil
            {
                print(error!.localizedDescription)
            }
            else
            {
                if let dictionary = self.parseJSON(data!)
                {
                    if let resultArray: NSArray = dictionary["results"] as? NSArray
                    {
                        if let cityInnerResultDictionary = resultArray[0] as? NSDictionary
                        {
                            self.cityDelegate!.didReceiveAPIResults(cityInnerResultDictionary)
                        }
                    }

                }
            }
        })
        task.resume()
    }
    
    func searchForecastFor(lat: Double, lng: Double)
    {
        let url = NSURL(string: "https://api.forecast.io/forecast/0b170c5cb9388e89a3ebf29a8a3c10c9/\(lat),\(lng)")
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url!, completionHandler: {data, response, error -> Void in
            if error != nil
            {
                print(error!.localizedDescription)
            }
            else
            {
                
                if let weatherDictionary = self.parseJSON(data!)
                {
                    self.weatherDelegate!.locationWeatherSearched(weatherDictionary)
                }
            }
        })
        task.resume()
    }

    
    
    func parseJSON(data: NSData) -> NSDictionary?
    {
        do
        {
            let dictionary: NSDictionary! = try NSJSONSerialization.JSONObjectWithData(data, options: []) as! NSDictionary
            return dictionary
        }
        catch let error as NSError
        {
            print(error)
            return nil
        }
    }
}