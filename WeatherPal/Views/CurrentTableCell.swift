//
//  CurrentTableCell.swift
//  WeatherPal
//
//  Created by Prem Shankar Rajagopalan Nayar on 9/4/23.
//

import UIKit

class CurrentTableCell: UITableViewCell {
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    @IBOutlet weak var highTemperatureLabel: UILabel!
    @IBOutlet weak var lowTemperatureLabel: UILabel!
    
    static let identifier = "CurrentTableCell"

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
        self.locationLabel.textAlignment = .center
        self.locationLabel.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        self.temperatureLabel.font = UIFont.boldSystemFont(ofSize: 50)
        self.weatherDescriptionLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
    }

    func configureCellData(currentWeather: Current?, dailyWeather: Daily?) {
        guard let current = currentWeather, let daily = dailyWeather else {
            return
        }
        
        self.locationLabel.text = "California"
        self.temperatureLabel.text = "\(Int(current.temp))°C"
        self.weatherDescriptionLabel.text = current.weather.first?.description.rawValue.uppercased()
        self.highTemperatureLabel.text = "High: \(Int(daily.temp.max))°C"
        self.lowTemperatureLabel.text = "Low: \(Int(daily.temp.min))°C"
    }
}
