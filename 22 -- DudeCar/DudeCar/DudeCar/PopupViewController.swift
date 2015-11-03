//
//  PopupViewController.swift
//  DudeCar
//
//  Created by Jennifer Hamilton on 11/3/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit
import CoreLocation

class PopupViewController: UIViewController, CLLocationManagerDelegate, UITextFieldDelegate
{
    @IBOutlet weak var addLocationButton: UIButton!
    @IBOutlet weak var locationTextField: UITextField!
    
    var delegate: PopupViewControllerDelegate?
    var locationString: String = ""
    
    var locations = [Location]()
    let locationManager = CLLocationManager()
    let geocoder = CLGeocoder()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        configureLocationManager()
        addLocationButton.enabled = false
        locationTextField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        var rc = false
        
        if locationTextField.text != ""
        {
            locationString = textField.text!
            textField.resignFirstResponder()
            locationManager.startUpdatingLocation()

            rc = true
        }
        return rc
    }
    
    // MARK: - CLLocation related methods
    
    func configureLocationManager()
    {
        if CLLocationManager.authorizationStatus() != CLAuthorizationStatus.Denied && CLLocationManager.authorizationStatus() != CLAuthorizationStatus.Restricted
        {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
            if CLLocationManager.authorizationStatus() == CLAuthorizationStatus.NotDetermined
            {
                locationManager.requestWhenInUseAuthorization()
            }
            else
            {
                addLocationButton.enabled = true
            }
        }
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus)
    {
        if status == CLAuthorizationStatus.AuthorizedWhenInUse
        {
            addLocationButton.enabled = true
        }
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError)
    {
        print(error.localizedDescription)
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let location = locations.last
        geocoder.reverseGeocodeLocation(location!, completionHandler: {(placemark: [CLPlacemark]?, error: NSError?) -> Void in
            
            if error != nil
            {
                print(error?.localizedDescription)
            }
            else
            {
                self.locationManager.stopUpdatingLocation()
                let name = self.locationString
                let lat = location?.coordinate.latitude
                let lng = location?.coordinate.longitude
                let aLocation = Location(name: name, lat: lat!, lng: lng!)
                self.locations.append(aLocation)
                self.delegate?.locationWasAdded(aLocation)
    
            }
        })
    }
    
    // MARK: - Action Handlers
    
    @IBAction func addLocationButtonTapped(sender: UIButton)
    {
        locationString = locationTextField.text!
        locationManager.startUpdatingLocation()
    }
    


}
