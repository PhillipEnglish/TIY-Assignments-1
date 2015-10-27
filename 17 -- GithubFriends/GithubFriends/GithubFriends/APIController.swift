//
//  APIController.swift
//  GithubFriends
//
//  Created by Jennifer Hamilton on 10/27/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

class APIController
{
    var delegate: APIControllerProtocol
    
    init(delegate: APIControllerProtocol)
    {
        // initializes with api object from TVC
        self.delegate = delegate
    }
    
    func searchGithubFor(searchTerm: String)
    {
            // the '?' signals the beginning of arguments
//            let url = NSURL(string: "https://api.github.com/users/" + searchTerm)
            let url = NSURL(string: "https://api.github.com/users/\(searchTerm)")
            // an app can only have one session at a time. shared session gets the session allocated to the app
            let session = NSURLSession.sharedSession()
            // completionHandler: code to be run when results are returned
            // we will get back data or error, and response
            let task = session.dataTaskWithURL(url!, completionHandler: {data, response, error -> Void in
                // instructions to run when complete:
                print("Task completed")
                if error != nil
                {
                    print(error!.localizedDescription)
                }
                else
                {
                    // because we are in a closure, use 'self' to point to parent function or class
                    if let dictionary = self.parseJSON(data!)
                    {
                        // FIXME: above dictionary is full, but not passing to results[]
//                        if let results: NSArray = dictionary["results"] as? NSArray
//                        {
                            self.delegate.didReceiveAPIResults(dictionary)
                            print("api results passed to delegate")
//                        }
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
