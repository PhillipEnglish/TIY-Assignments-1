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
    var delegate: APIControllerProtocol
    
    init(delegate: APIControllerProtocol)
    {
        self.delegate = delegate
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
                        if let innerResultDictionary = resultArray[0] as? NSDictionary
                        {
                            self.delegate.didReceiveAPIResults(innerResultDictionary)
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
                    self.delegate.didReceiveAPIResults(weatherDictionary)
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