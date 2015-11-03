//
//  ViewController.swift
//  Forecaster
//
//  Created by Jennifer Hamilton on 10/29/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit
import CoreLocation

class LocationSearchViewController: UIViewController, UITextFieldDelegate, CLLocationManagerDelegate
{
    @IBOutlet weak var zipTextField: UITextField!
    @IBOutlet weak var alertLabel: UILabel!
    @IBOutlet weak  var currentLocationButton: UIButton!

    var delegate: LocationSearchViewControllerDelegate?
    var zipCode: String = ""
    
    let locationManager = CLLocationManager()
    let geocoder = CLGeocoder()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        currentLocationButton.enabled = false
        configureLocationManager()
        
        alertLabel.text = ""
        alertLabel.textColor = UIColor.redColor()
        zipTextField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }

    // MARK: - UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        var rc = false

        if zipTextField.text != ""
        {
            if validateZipCode(textField.text!)
            {
                alertLabel.text = ""
                zipCode = textField.text!
                textField.resignFirstResponder()
                rc = true
                delegate?.locationWasSelected(Int(zipCode)!)
            }
            else
            {
                textField.text = ""
                textField.becomeFirstResponder()
                alertLabel.text = "Invalid Entry!"
            }
        }
        return rc
    }

    func validateZipCode(zip: String) -> Bool
    {
        let characterSet = NSCharacterSet(charactersInString: "0123456789")
        if zip.characters.count == 5  && zip.rangeOfCharacterFromSet(characterSet)?.count == 1
        {
            return true
        }
        else
        {
            return false
        }
    }
    
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
                currentLocationButton.enabled = true
            }
        }
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus)
    {
        if status == CLAuthorizationStatus.AuthorizedWhenInUse
        {
            currentLocationButton.enabled = true
        }
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError)
    {
        print(error.localizedDescription)
    }

//    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
//    {
//        let location = locations.last
//        geocoder.reverseGeocodeLocation(location!{(, completionHandler: <#T##CLGeocodeCompletionHandler##CLGeocodeCompletionHandler##([CLPlacemark]?, NSError?) -> Void#>)
//    }
}

