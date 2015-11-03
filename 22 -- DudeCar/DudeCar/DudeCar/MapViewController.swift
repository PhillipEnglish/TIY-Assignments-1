//
//  ViewController.swift
//  DudeCar
//
//  Created by Jennifer Hamilton on 11/3/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

let kLocationsKey = "locations"

protocol PopupViewControllerDelegate
{
    func locationWasAdded(location: Location)
}

class MapViewController: UIViewController, PopupViewControllerDelegate, UIPopoverPresentationControllerDelegate, CLLocationManagerDelegate, MKMapViewDelegate
{
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var addPinBarButton: UIBarButtonItem!

    var locations = [Location]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
       
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "ShowPopoverSegue"
        {
            let destVC = segue.destinationViewController as! PopupViewController
            destVC.popoverPresentationController?.delegate = self
            destVC.delegate = self
            destVC.preferredContentSize = CGSizeMake(200.0, 80.0)
        }
    }
    
    
    // MARK: - Popover View Controller Delegate
    
    func locationWasAdded(location: Location)
    {
        navigationController?.dismissViewControllerAnimated(true, completion: nil)
        locations.append(location)
        // code to pass object properties to annotations
    }
    
    // MARK: - UIPopover Presentation Controller Delegate
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle
    {
        return .None
    }
    
    // MARK: - MapKit
    // TODO: setup map to show pin at user location
    
    

    // MARK: - Save and load user location details
    
    func loadMapData()
    {
        if let data = NSUserDefaults.standardUserDefaults().objectForKey(kLocationsKey) as? NSData
        {
            if let savedLocations = NSKeyedUnarchiver.unarchiveObjectWithData(data) as? [Location]
            {
                locations = savedLocations
                view.reloadInputViews()
            }
        }
    }
    
    func saveMapData()
    {
        let mapData = NSKeyedArchiver.archivedDataWithRootObject(locations)
        NSUserDefaults.standardUserDefaults().setObject(mapData, forKey: kLocationsKey)
    }

}

    



