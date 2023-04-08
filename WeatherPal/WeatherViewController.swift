//
//  WeatherViewController.swift
//  WeatherPal
//
//  Created by Prem Shankar Rajagopalan Nayar on 8/4/23.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {
    
    let locationManager = CLLocationManager()
    var userLocation: CLLocation?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getUserLocation()
    }
    
    func getUserLocation() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
}

extension WeatherViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if !locations.isEmpty, userLocation == nil {
            userLocation = locations.first
            locationManager.stopUpdatingLocation()
        }
        tempFunction()
    }
    
    func tempFunction() {
        guard let currentLocation = userLocation else {
            return
        }
        print("Latitude is \(currentLocation.coordinate.latitude) and longitude is \(currentLocation.coordinate.longitude)")
    }
}
