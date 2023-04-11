//
//  HourlyCollectionCell.swift
//  WeatherPal
//
//  Created by Prem Shankar Rajagopalan Nayar on 10/4/23.
//

import UIKit
import SDWebImage

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

    func configureData(hourlyWeather: Current?, timezone: String) {
        guard let hourly = hourlyWeather else {
            return
        }
        if let icon = hourly.weather.first?.icon {
            let imageUrlString = "\(Constants.baseImageUrl)\(icon)@2x.png"
            self.iconImageView.sd_imageIndicator = SDWebImageActivityIndicator.medium
            self.iconImageView.sd_setImage(with: URL(string: imageUrlString))
        }
        self.timeLabel.text = Utils.getTime(unixTime: hourly.dt, timezone: timezone)
        self.tempLabel.text = "\(Int(hourly.temp))°"
    }
}
