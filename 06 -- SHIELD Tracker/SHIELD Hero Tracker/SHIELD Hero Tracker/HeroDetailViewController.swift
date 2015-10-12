//
//  HeroDetailViewController.swift
//  SHIELD Hero Tracker
//
//  Created by Jennifer Hamilton on 10/12/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

@objc protocol HeroPickerDelegate
{
    func didSelectRowAtIndexPath(heroChosen: UITableViewCell)
}

class HeroDetailViewController: UIViewController
{

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var homeworldLabel: UILabel!
    @IBOutlet weak var powersLabel: UILabel!
    
    var aHero: Hero?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - HeroDetail Delegate
    
    func didSelectRowAtIndexPath(aHero: Hero)
    {
        nameLabel.text = aHero.name
        homeworldLabel.text = aHero.homeworld
        powersLabel.text = aHero.powers
        
    }
    
}
