//
//  HeroDetailViewController.swift
//  SHIELD Hero Tracker
//
//  Created by Jennifer Hamilton on 10/12/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

@objc protocol HeroDetailDelegate
{
    func heroDetailsRequested(heroChosen: NSDictionary)
}

class HeroDetailViewController: UIViewController, HeroDetailDelegate
{

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var homeworldLabel: UILabel!
    @IBOutlet weak var powersLabel: UILabel!
    var hero: Hero?
    var delegate: HeroDetailDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayDetails()

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "ShowHeroDetailSegue"
        {
            // find out what is on the other side of the segue
            let heroDetailVC = segue.destinationViewController
                // 'as!' casts to DatePickerViewController, allowing the use of 'delegate'
                as! HeroDetailViewController
            heroDetailVC.delegate = self
        }
    }
    
    // MARK: - HeroDetail Delegate
    
    func heroDetailsRequested(heroChosen: NSDictionary)
    {
        
    }

    // MARK: - DatePicker Delegate
//    
//    func destinationDateWasChosen(dateChosen: NSDate)
//    {
//        // passing data from DatePicker class to current class when the "Back" button is selected
//        destinationTimeLabel.text = dateFormatter.stringFromDate(dateChosen)
//    }
    
    // MARK: - Private Functions
    
    private func displayDetails(hero: Hero)
    {
        nameLabel.text = hero.name
        homeworldLabel.text = hero.homeworld
        powersLabel.text = hero.powers
        
    }

}
