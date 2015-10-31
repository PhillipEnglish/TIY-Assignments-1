//
//  CityDetailViewController.swift
//  Forecaster
//
//  Created by Jennifer Hamilton on 10/29/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class CityDetailViewController: UIViewController
{
    var city = City?()
    
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var apparentTempLabel: UILabel!
    @IBOutlet weak var dewpointLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var precipProbLabel: UILabel!
    @IBOutlet weak var precipIntensityLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        setLabels()
        mapLocation()
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }

    
    // TODO: format DetailVC
    
    // MARK: - Setup View
    
    func setLabels()
    {
        let iconString: String = String(city!.currentWeather?.icon)
        iconImage.image = UIImage(named: iconString)
        currentTempLabel.text = String(city?.currentWeather?.temperature)
        apparentTempLabel.text = String(city?.currentWeather?.apparentTemperature)
        dewpointLabel.text = String(city?.currentWeather?.dewpoint)
        pressureLabel.text = String(city?.currentWeather?.pressure)
        humidityLabel.text = String(city?.currentWeather?.humidity)
        precipProbLabel.text = String(city?.currentWeather?.precipProbability)
        precipIntensityLabel.text = String(city?.currentWeather?.precipIntensity)
    }
    
    
    // MARK: - Map Display
    
    func mapLocation()
    {
        // helper: http://stackoverflow.com/questions/27495328/reverse-geocode-location-in-swift
        
        let latitude: CLLocationDegrees = (city?.lat)!
        let longitude: CLLocationDegrees = (city?.lng)!
        let location = CLLocation(latitude: latitude, longitude: longitude)
        
        CLGeocoder().reverseGeocodeLocation(location, completionHandler: {(placemarks, error) -> Void in
            let mappedLocation = CLLocationCoordinate2DMake(latitude,longitude)
            let viewRegion = MKCoordinateRegionMakeWithDistance(mappedLocation, 10000, 10000)
            self.mapView.setRegion(viewRegion, animated: true)
        })
    }
    
    
    // TODO: add 7 day forecast data detial view
    
    // MARK: - Navigation
    
    @IBAction func doneButton(sender: UIBarButtonItem)
    {
        navigationController?.popViewControllerAnimated(true)

    }

}
