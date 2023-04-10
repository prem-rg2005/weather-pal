//
//  Constants.swift
//  WeatherPal
//
//  Created by Prem Shankar Rajagopalan Nayar on 8/4/23.
//

import Foundation
import UIKit

class Constants {
    static let baseUrl = "https://api.openweathermap.org/data/3.0/onecall"
    static let apiKey = "ce897ff683d145ccae345e1d0296b6d8"

    /*
     Add image name, resolution and '.png' after this base url
     Eg: If image name is 10d, URL should be "https://openweathermap.org/img/wn/10d@2x.png"
    */
    static let baseImageUrl = "https://openweathermap.org/img/wn/"
    static let mainBackgroundColor: UIColor = UIColor(red: 88/255.0, green: 156/255.0, blue: 199/255.0, alpha: 1.0)
}
