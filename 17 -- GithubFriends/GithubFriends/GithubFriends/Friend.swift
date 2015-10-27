//
//  Friend.swift
//  GithubFriends
//
//  Created by Jennifer Hamilton on 10/27/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

struct Friend
{
    let login: String
    let name: String
    let location: String
    let email: String
    let bio: String
    let avatar_url: String
    
    init(login: String, name: String, location: String, email: String, bio: String, avatar_url: String)
    {
        self.login = login
        self.name = name
        self.location = location
        self.email = email
        self.bio = bio
        self.avatar_url = avatar_url
    }
    
    static func friendsWithJSON(results: NSDictionary) -> [Friend]
    {
        var friends = [Friend]()
        
        if results.count > 0
        {
            let login = results.valueForKey("login") as? String ?? ""
            let name = results.valueForKey("name") as? String ?? ""
            let location = results.valueForKey("location") as? String ?? ""
            let email = results.valueForKey("email") as? String ?? ""
            let bio = results.valueForKey("bio") as? String ?? ""
            let avatar_url = results.valueForKey("avatar_url") as? String ?? ""
                
             friends.append(Friend(login: login, name: name, location: location, email: email, bio: bio, avatar_url: avatar_url))
        }
        return friends
    }
    
    
}