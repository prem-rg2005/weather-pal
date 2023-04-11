//
//  WeatherViewModel.swift
//  WeatherPal
//
//  Created by Prem Shankar Rajagopalan Nayar on 8/4/23.
//

import Foundation
import CoreLocation

class WeatherViewModel {
    // MARK: Variables
    var userLocation: CLLocation?
    var weatherData: WeatherData? {
        didSet {
            self.currentWeather = self.weatherData?.current
            self.hourlyWeather = self.weatherData?.hourly
            self.dailyWeather = self.weatherData?.daily.first
            self.weeklyWeather = self.weatherData?.daily
        }
    }
    var currentWeather: Current?
    var hourlyWeather: [Current]?
    var dailyWeather: Daily?
    var weeklyWeather: [Daily]?

    // MARK: Function to call Weather API
    func getWeatherDetails(completion: @escaping () -> Void) {
        weatherData = nil
        guard let location  = self.userLocation else {
            return
        }
        let urlString = "\(Constants.baseUrl)?lat=\(location.coordinate.latitude)&lon=\(location.coordinate.longitude)&exclude=minutely&units=metric&appid=\(Constants.apiKey)"

        guard let url = URL(string: urlString) else {
            print("Error getting URL")
            return
        }

        URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            guard let data = data, error == nil else {
                print("Error while trying to retrieve data from server")
                return
            }
            do {
                self.weatherData = try JSONDecoder().decode(WeatherData.self, from: data)
            } catch {
                print("Error is \(error)")
            }
            guard self.weatherData != nil else {
                return
            }
            completion()
        }).resume()
    }
}
