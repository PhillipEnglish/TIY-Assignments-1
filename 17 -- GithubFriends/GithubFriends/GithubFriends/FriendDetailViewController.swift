//
//  FriendDetailViewController.swift
//  GithubFriends
//
//  Created by Jennifer Hamilton on 10/27/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class FriendDetailViewController: UIViewController
{
    let avatarImage = UILabel(frame: CGRect(x: 25, y: 75, width: 150, height: 150))
    let nameLabel = UILabel(frame: CGRect(x: 50, y: 225, width: (Int(UIScreen.mainScreen().bounds.width)-50), height: 50))
    let loginLabel = UILabel(frame: CGRect(x: 50, y: 250, width: (Int(UIScreen.mainScreen().bounds.width)-50), height: 50))
    let locationLabel = UILabel(frame: CGRect(x: 50, y: 275, width: (Int(UIScreen.mainScreen().bounds.width)-50), height: 50))
    let emailLabel = UILabel(frame: CGRect(x: 50, y: 300, width: (Int(UIScreen.mainScreen().bounds.width)-50), height: 50))
    let bioLabel = UILabel(frame: CGRect(x: 50, y: 325, width: (Int(UIScreen.mainScreen().bounds.width)-50), height: 50))

    
    var friend = Friend?()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        title = friend!.name
        setupView()
        setDetails()
        
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    func setupView()
    {
        view.backgroundColor = UIColor.whiteColor()
        
//        avatarImage.center.x = view.center.x
        loginLabel.center.x = view.center.x
        nameLabel.center.x = view.center.x
        locationLabel.center.x = view.center.x
        emailLabel.center.x = view.center.x
        bioLabel.center.x = view.center.x
        
        nameLabel.font = UIFont(name: "Helvetica", size: 24)
        avatarImage.backgroundColor = UIColor.lightGrayColor()
        
        view.addSubview(avatarImage)
        view.addSubview(loginLabel)
        view.addSubview(nameLabel)
        view.addSubview(locationLabel)
        view.addSubview(emailLabel)
        view.addSubview(bioLabel)
        
    }
    
    func setDetails()
    {
        // http://stackoverflow.com/questions/24231680/loading-image-from-url
        if let url = NSURL(string: friend!.avatar_url) {
            if let data = NSData(contentsOfURL: url){
                avatarImage.contentMode = UIViewContentMode.ScaleAspectFit
                avatarImage.addSubview(UIImageView(image: UIImage(data: data)))
            }
        }
      
//        avatarImage.addSubview(UIImageView(image: UIImage(named: "\(friend!.avatar_url)")))
        nameLabel.text = String(friend!.name)
        loginLabel.text = String(friend!.login)
        locationLabel.text = String(friend!.location)
        emailLabel.text = String(friend!.email)
        bioLabel.text = String(friend!.bio)
    }
}

