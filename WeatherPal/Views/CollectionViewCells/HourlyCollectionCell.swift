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
        self.iconImageView.showLoading()
    }

    func configureData(hourlyWeather: Current?, timezone: String) {
        guard let hourly = hourlyWeather else {
            return
        }
        if let icon = hourly.weather.first?.icon {
            let imageUrlString = "\(Constants.baseImageUrl)\(icon)@2x.png"
            self.iconImageView.loadImageFromUrl(urlString: imageUrlString) { [weak self] in
                self?.iconImageView.stopLoading()
            }
        }
        self.timeLabel.text = Utils.getTime(unixTime: hourly.dt, timezone: timezone)
        self.tempLabel.text = "\(Int(hourly.temp))°"
    }
}
