//
//  ViewController.swift
//  MuttCutts
//
//  Created by Jennifer Hamilton on 10/28/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

protocol PopoverAddLocationsViewControllerDelegate
{
    func locationsWereSelected(from: String, to: String)
}

class MapViewController: UIViewController, PopoverAddLocationsViewControllerDelegate, UIPopoverPresentationControllerDelegate
{

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var distanceLabel: UILabel!
    
    var location1 = CLLocationCoordinate2DMake(28.540923, -81.38216)
    var location1Annotation = MKPointAnnotation()
    var location1TitleString: String? = "test1"
    
    var location2 = CLLocationCoordinate2DMake(27.770068, -82.63642)
    var location2Annotation = MKPointAnnotation()
    var location2TitleString: String? = "test2"
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        distanceLabel.hidden = true
        setLocations()
        mapLocations()
        calculateDistance()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "ShowPopoverSegue"
        {
            let destVC = segue.destinationViewController as! PopoverAddLocationsViewController
            destVC.popoverPresentationController?.delegate = self
            destVC.delegate = self
            destVC.preferredContentSize = CGSizeMake(400.0, 200.0)
        }
    }

    
    // MARK: - Action Handlers
    
    // MARK: - UIPopover Presentation Controller Delegate
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle
    {
        return .None
    }
    
    
    // MARK: - Popover Delegate
    func locationsWereSelected(from: String, to: String)
    {
        navigationController?.dismissViewControllerAnimated(true, completion: nil)

        
        let loc1 = getLocations(from)
        let loc2 = getLocations(to)
        
        location1 = loc1.coordinate
        location2 = loc2.coordinate
        
        location1TitleString = String(loc1.title)
        location2TitleString = String(loc2.title)
        
        view.reloadInputViews()
    }
    
    // MARK: - Private Functions
    
    private func getLocations(location: String) -> MKAnnotation
    {
        // geocoding
        let geocoder = CLGeocoder()
        let annotation = MKPointAnnotation()
        geocoder.geocodeAddressString(location, completionHandler: {(placemarks: [CLPlacemark]?, error: NSError?) -> Void in
            if let placemark = placemarks?[0]
            {
                
                annotation.coordinate = (placemark.location?.coordinate)!
                annotation.title = location
                self.mapView.addAnnotation(annotation)
            }
        })
        return annotation
    }
    
    private func setLocations()
    {
        // map creation:
        location1Annotation.coordinate = location1
        location1Annotation.title = location1TitleString
        
        location2Annotation.coordinate = location2
        location2Annotation.title = location2TitleString
    }
    
    private func mapLocations()
    {
//        let viewRegion = MKCoordinateRegionMakeWithDistance(tiyOrlando, 2000, 2000)
//        mapView.setRegion(viewRegion, animated: true)

        let annotations = [location1Annotation,location2Annotation]
        mapView.addAnnotations(annotations)
        mapView.showAnnotations(annotations, animated: true)
        // zoom out enough to show the annotations
        mapView.camera.altitude *= 2
    }
    
    private func calculateDistance()
    {
        // creating a location object
        let loc1 = CLLocation(coordinate: location1, altitude: 0, horizontalAccuracy: 0, verticalAccuracy: 0, timestamp: NSDate())
        let loc2 = CLLocation(coordinate: location2, altitude: 0, horizontalAccuracy: 0, verticalAccuracy: 0, timestamp: NSDate())
        let lineOfSightDistance = loc1.distanceFromLocation(loc2)
        distanceLabel.hidden = false
        distanceLabel.text = ("Distance between \(location1TitleString) and \(location2TitleString): " + String(format: "%.2f", lineOfSightDistance * 0.00062137) + " miles")
    }

}

