//
//  WeatherViewController.swift
//  WeatherPal
//
//  Created by Prem Shankar Rajagopalan Nayar on 8/4/23.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Constants and variables
    var viewModel: WeatherViewModel?
    let locationManager = CLLocationManager()
    var userLocation: CLLocation?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(WeeklyTableCell.nib(), forCellReuseIdentifier: WeeklyTableCell.identifier)
        tableView.register(HourlyTableCell.nib(), forCellReuseIdentifier: HourlyTableCell.identifier)
        locationManager.delegate = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getUserLocation()
    }

    func getUserLocation() {
        if userLocation == nil {
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
        }
    }
}

extension WeatherViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension WeatherViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if !locations.isEmpty, userLocation == nil {
            userLocation = locations.first
            locationManager.stopUpdatingLocation()
        }
        guard let location = userLocation else {
            print("1------ User's location is still not updated")
            return
        }
        viewModel = WeatherViewModel(userLocation: location)
        viewModel?.getWeatherDetails(completion: {
            print("1------ Weather data updated")
        })
    }
}
