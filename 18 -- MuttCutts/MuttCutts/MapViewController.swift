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

class MapViewController: UIViewController
{

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var distanceLabel: UILabel!
    
    let location1 = CLLocationCoordinate2DMake(28.540923, -81.38216)
    let location1Annotation = MKPointAnnotation()
    let location1TitleString: String? = "test1"
    
    let location2 = CLLocationCoordinate2DMake(27.770068, -82.63642)
    let location2Annotation = MKPointAnnotation()
    let location2TitleString: String? = "test2"
    
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
    
    // MARK: - Setup
    
     func setupView()
    {
    
    }
    
    // MARK: - Action Handlers
    
    
    // MARK: - Popover Delegate
    // TODO: add delegate actions for popover
    
    // MARK: - Private Functions
    
    private func getLocations()
    {
        // geocoding
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString("Lakeland, FL", completionHandler: {(placemarks: [CLPlacemark]?, error: NSError?) -> Void in
            if let placemark = placemarks?[0]
            {
                let annotation = MKPointAnnotation()
                annotation.coordinate = (placemark.location?.coordinate)!
                annotation.title = "Lakeland, FL"
                self.mapView.addAnnotation(annotation)
            }
        })
    }
    
    private func setLocations()
    {
        // map creation:
        location1Annotation.coordinate = location1
        location1Annotation.title = location1TitleString
//        location1Annotation.subtitle = "Orlando"
        
        location2Annotation.coordinate = location2
        location2Annotation.title = location2TitleString
//        location2Annotation.subtitle = "Tampa"

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
        let orlandoLocation = CLLocation(coordinate: location1, altitude: 0, horizontalAccuracy: 0, verticalAccuracy: 0, timestamp: NSDate())
        let tampaLocation = CLLocation(coordinate: location2, altitude: 0, horizontalAccuracy: 0, verticalAccuracy: 0, timestamp: NSDate())
        let lineOfSightDistance = orlandoLocation.distanceFromLocation(tampaLocation)
        distanceLabel.hidden = false
        distanceLabel.text = ("Distance between \(location1Annotation.subtitle!) and \(location2Annotation.subtitle!): " + String(format: "%.2f", lineOfSightDistance * 0.00062137) + " miles")
    }

}

