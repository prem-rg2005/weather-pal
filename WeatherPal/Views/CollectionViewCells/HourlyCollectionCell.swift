//
//  HourlyCollectionCell.swift
//  WeatherPal
//
//  Created by Prem Shankar Rajagopalan Nayar on 10/4/23.
//

import UIKit

class HourlyCollectionCell: UICollectionViewCell {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    static let identifier = "HourlyCollectionCell"

    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    private func configureUI() {
        self.timeLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        self.timeLabel.textColor = .white
        self.tempLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        self.tempLabel.textColor = .white
    }

    func configureData(hourlyWeather: Current?) {
        guard let hourly = hourlyWeather else {
            return
        }
        if let icon = hourly.weather.first?.icon {
            let imageUrlString = "\(Constants.baseImageUrl)\(icon)@2x.png"
            self.iconImageView.loadImageFromUrl(urlString: imageUrlString)
        }
        self.timeLabel.text = "Now"
        self.tempLabel.text = "\(Int(hourly.temp))°"
    }
    
    func getTimeForDate(_ date: Date?) -> String {
        guard let inputDate = date else {
            return ""
        }
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter.string(from: inputDate)
    }
}
