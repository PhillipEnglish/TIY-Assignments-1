//
//  ViewController.swift
//  GithubFriends
//
//  Created by Jennifer Hamilton on 10/27/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

protocol APIControllerProtocol
{
    func didReceiveAPIResults(results: NSDictionary)
}

class NewFriendViewController: UITableViewController, APIControllerProtocol
{
    var friends = [Friend]()
    var api: APIController!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        api = APIController(delegate: self)
        api.searchGithubFor("embryoconcepts")
        api.searchGithubFor("jcgohlke")
        api.searchGithubFor("daaavid")

        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "FriendCell")
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return friends.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("FriendCell", forIndexPath: indexPath)
        
        let friend = friends[indexPath.row]
        cell.textLabel?.text = friend.name
        
        return cell
    }
    // MARK: - API Controller Protocol
    
    func didReceiveAPIResults(results: NSDictionary)
    {
        dispatch_async(dispatch_get_main_queue(), {
            self.friends = Friend.friendsWithJSON(results)
            self.tableView.reloadData()
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        })

    }

}

