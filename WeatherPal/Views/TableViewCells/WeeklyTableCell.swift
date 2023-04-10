//
//  WeeklyTableCell.swift
//  WeatherPal
//
//  Created by Prem Shankar Rajagopalan Nayar on 8/4/23.
//

import UIKit

class WeeklyTableCell: UITableViewCell {

    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var highTempLabel: UILabel!
    @IBOutlet weak var lowTempLabel: UILabel!
    @IBOutlet weak var weatherIconView: UIImageView!
    
    static let identifier = "WeeklyTableCell"

    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    private func configureUI() {
        self.dayLabel.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        self.lowTempLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        self.highTempLabel.font = UIFont.systemFont(ofSize: 14, weight: .heavy)
    }
    
    func configureCellData(weeklyWeather: Daily?) {
        guard let weekly = weeklyWeather else {
            return
        }
        if let icon = weekly.weather.first?.icon {
            let imageUrlString = "\(Constants.baseImageUrl)\(icon)@2x.png"
            self.weatherIconView.loadImageFromUrl(urlString: imageUrlString)
        }

        self.dayLabel.text = getDayForDate(Date(timeIntervalSince1970: TimeInterval(weekly.dt)))
        self.highTempLabel.text = "H: \(Int(weekly.temp.max))°"
        self.lowTempLabel.text = "L: \(Int(weekly.temp.min))°"
    }
    
    func getDayForDate(_ date: Date?) -> String {
        guard let inputDate = date else {
            return ""
        }
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter.string(from: inputDate)
    }
}
