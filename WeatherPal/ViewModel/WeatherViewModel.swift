//
//  WeatherViewModel.swift
//  WeatherPal
//
//  Created by Prem Shankar Rajagopalan Nayar on 8/4/23.
//

import Foundation
import CoreLocation

class WeatherViewModel {
    var weatherData: WeatherData? {
        didSet {
            self.dailyWeather = self.weatherData?.daily
            self.hourlyWeather = self.weatherData?.hourly
        }
    }
    var dailyWeather: [Daily]?
    var hourlyWeather: [Current]?
    var userLocation: CLLocation
    
    public init(userLocation: CLLocation) {
        self.userLocation = userLocation
    }

    func getWeatherDetails(completion: @escaping () -> Void) {
        weatherData = nil
        let urlString = "\(Constants.baseUrl)?lat=\(self.userLocation.coordinate.latitude)&lon=\(self.userLocation.coordinate.longitude)&exclude=minutely&appid=\(Constants.apiKey)"

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
