//
//  HeroDetailViewController.swift
//  SHIELD Hero Tracker
//
//  Created by Jennifer Hamilton on 10/12/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class HeroDetailViewController: UIViewController
{

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var homeworldLabel: UILabel!
    @IBOutlet weak var powersLabel: UILabel!
    
    var aHero: Hero?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Hero Details"
        
        
        nameLabel.text = aHero!.name.uppercaseString
        homeworldLabel.text = aHero!.homeworld.uppercaseString
        powersLabel.text = aHero!.powers.uppercaseString
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
