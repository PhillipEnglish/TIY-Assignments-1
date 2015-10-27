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
        self.delegate = delegate
    }
    
    func searchGithubFor(searchTerm: String)
    {
            let url = NSURL(string: "https://api.github.com/users/\(searchTerm)")
            let session = NSURLSession.sharedSession()
            let task = session.dataTaskWithURL(url!, completionHandler: {data, response, error -> Void in
                print("Task completed")
                if error != nil
                {
                    print(error!.localizedDescription)
                }
                else
                {
                    if let dictionary = self.parseJSON(data!)
                    {
                            self.delegate.didReceiveAPIResults(dictionary)
                            print("api results passed to delegate")
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
