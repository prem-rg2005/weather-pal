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
    var viewModel = WeatherViewModel()
    let locationManager = CLLocationManager()
    var userLocation: CLLocation?
    let sections: [SectionTypes] = [.current, .hourly, .weekly]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 88/255.0, green: 156/255.0, blue: 199/255.0, alpha: 1.0)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CurrentTableCell.nib(), forCellReuseIdentifier: CurrentTableCell.identifier)
        tableView.register(WeeklyTableCell.nib(), forCellReuseIdentifier: WeeklyTableCell.identifier)
        tableView.register(HourlyTableCell.nib(), forCellReuseIdentifier: HourlyTableCell.identifier)
        locationManager.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateViewModel {
            self.tableView.reloadData()
        }
    }

    func getUserLocation() {
        if self.userLocation == nil {
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
        }
    }
    
    func updateViewModel(completion: @escaping () -> Void) {
        getUserLocation()
        if self.userLocation != nil {
            viewModel.userLocation = self.userLocation
            viewModel.getWeatherDetails(completion: completion)
        }
    }
}

extension WeatherViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if sections[section] == .weekly {
            return viewModel.weeklyWeather?.count ?? 1
        } else {
            return 1
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if sections[indexPath.section] == .current {
            let cell = tableView.dequeueReusableCell(withIdentifier: CurrentTableCell.identifier, for: indexPath) as! CurrentTableCell
            cell.configureCellData(currentWeather: self.viewModel.currentWeather, dailyWeather: self.viewModel.dailyWeather)
            return cell
        } else if sections[indexPath.section] == .weekly {
            let cell = tableView.dequeueReusableCell(withIdentifier: WeeklyTableCell.identifier, for: indexPath) as! WeeklyTableCell
            cell.configureCellData(weeklyWeather: self.viewModel.weeklyWeather?[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if sections[indexPath.section] == .current {
            return 250
        } else if sections[indexPath.section] == .weekly {
            return 50
        }
        return UITableView.automaticDimension
    }
}

extension WeatherViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if !locations.isEmpty, userLocation == nil {
            userLocation = locations.first
            locationManager.stopUpdatingLocation()
            updateViewModel {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
}
