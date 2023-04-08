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
}
