//
//  WeatherViewModel.swift
//  WeatherPal
//
//  Created by Prem Shankar Rajagopalan Nayar on 8/4/23.
//

import Foundation

class WeatherViewModel {
    var latitude: String
    var longitude: String
    
    public init(latitude: String, longitude: String) {
        self.latitude = latitude
        self.longitude = longitude
    }
    
    func getWeatherDetails() {
        let urlString = "https://api.openweathermap.org/data/3.0/onecall?lat=\(latitude)&lon=\(longitude)&exclude=minutely&appid=\(Constants.apiKey)"
        
        guard let url = URL(string: urlString) else {
            // Include some error description, maybe an alert
            return
        }
        
        URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            guard let data = data, error == nil else {
                // Include some error description, maybe an alert
                return
            }
        })
    }
}
