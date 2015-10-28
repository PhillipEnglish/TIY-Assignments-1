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

class FriendTableViewController: UITableViewController, APIControllerProtocol
{
    var friends = [Friend]()
    var api: APIController!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        api = APIController(delegate: self)
        api.searchGithubFor("embryoconcepts")
        api.searchGithubFor("embryoconcepts")
        api.searchGithubFor("embryoconcepts")

        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "FriendCell")
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
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
        cell.detailTextLabel?.text = friend.login
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        let aFriend = friends[indexPath.row]
        let friendDetailVC = FriendDetailViewController()
        friendDetailVC.friend = aFriend
        friendDetailVC.setDetails()
        
        navigationController?.pushViewController(friendDetailVC, animated: true)
    }
    
    // MARK: - API Controller Protocol
    
    func didReceiveAPIResults(results: NSDictionary)
    {
        dispatch_async(dispatch_get_main_queue(), {
            
            // TODO: iterate over the results and store in friends
            let login = results.valueForKey("login") as? String ?? ""
            let name = results.valueForKey("name") as? String ?? ""
            let location = results.valueForKey("location") as? String ?? ""
            let email = results.valueForKey("email") as? String ?? ""
            let bio = results.valueForKey("bio") as? String ?? ""
            let avatar_url = results.valueForKey("avatar_url") as? String ?? ""
            
            self.friends.append(Friend(login: login, name: name, location: location, email: email, bio: bio, avatar_url: avatar_url))
//            self.friends = Friend.friendsWithJSON(results)
            self.tableView.reloadData()
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        })

    }

}

