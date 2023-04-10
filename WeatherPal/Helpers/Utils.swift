//
//  Utils.swift
//  WeatherPal
//
//  Created by Prem Shankar Rajagopalan Nayar on 10/4/23.
//

import Foundation

class Utils {
    
    // Function to get time in '2:00 PM' format from server. Converts UNIX UTC  time into desired format
    static func getTime(unixTime: Int, timezone: String) -> String {
        let currentTime = Date(timeIntervalSince1970: TimeInterval(unixTime))
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short
        dateFormatter.timeZone = TimeZone(abbreviation: timezone)
        dateFormatter.locale = Locale.autoupdatingCurrent
        return dateFormatter.string(from: currentTime as Date)
    }
    
    // Function to retrieve day of the week
    static func getDayForDate(_ date: Date?) -> String {
        guard let inputDate = date else {
            return ""
        }
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter.string(from: inputDate)
    }
}
