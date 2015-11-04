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
//    @IBOutlet weak var distanceLabel: UILabel!
//    @IBOutlet weak var blurView: UIVisualEffectView!

    var locations = [Location]()
    let geocoder = CLGeocoder()
    var distance: CLLocationDistance?
    var annotations = [MKPointAnnotation]()
    var location1: Location?
    var location2: Location?
    var location1Coordinates = CLLocationCoordinate2DMake(0,0)
    var location2Coordinates = CLLocationCoordinate2DMake(0,0)
    var location1Annotation = MKPointAnnotation()
    var location2Annotation = MKPointAnnotation()
//    var mapRoute: MKRoute?
    
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
    
    // MARK: - UIPopover Presentation Controller Delegate
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle
    {
        return .None
    }
    
    // MARK: - Popover View Controller Delegate
    
    func locationWasAdded(location: Location)
    {
        navigationController?.dismissViewControllerAnimated(true, completion: nil)
        
        locations.append(location)
        if locations.count == 1
        {
            location1 = location
        }
        else if locations.count == 2
        {
            location2 = location
            mapLocations(location1!, location2: location2!)
            pinLocations(location1!, location2: location2!)
        }
        else
        {
            locations.removeAll()
            location1 = location
        }
        
    }
    // MARK: - MapKit
    // TODO: setup map to show pin at user location

    func mapLocations(location1: Location, location2: Location)
    {
        // map creation:
        location1Coordinates = CLLocationCoordinate2DMake(location1.lat, location1.lng)
        location1Annotation = MKPointAnnotation()
        location1Annotation.coordinate = location1Coordinates
        location1Annotation.title = location1.name
        
        location2Coordinates = CLLocationCoordinate2DMake(location2.lat,location2.lng)
        location2Annotation = MKPointAnnotation()
        location2Annotation.coordinate = location2Coordinates
        location2Annotation.title = location2.name
        
        let annotations = [location1Annotation,location2Annotation]
        mapView.addAnnotations(annotations)
        mapView.showAnnotations(annotations, animated: true)
        // zoom out enough to show the annotations
        mapView.camera.altitude *= 2
        
        let viewRegion = MKCoordinateRegionMakeWithDistance(location1.coordinate, 2000, 2000)
        mapView.setRegion(viewRegion, animated: true)
    }
    
    func pinLocations(location1: Location, location2: Location)
    {
        let loc1 = CLLocation(coordinate: location1Coordinates, altitude: 0, horizontalAccuracy: 0, verticalAccuracy: 0, timestamp: NSDate())
        let loc2 = CLLocation(coordinate: location2Coordinates, altitude: 0, horizontalAccuracy: 0, verticalAccuracy: 0, timestamp: NSDate())
        let lineOfSightDistance = loc1.distanceFromLocation(loc2)
        print("distance between \(location1Annotation.title!) and \(location2Annotation.title!): " + String(format: "%.2f", lineOfSightDistance * 0.00062137) + " miles")
    }


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

    



