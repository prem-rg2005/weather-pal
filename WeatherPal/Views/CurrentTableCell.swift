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
    
    func configureUI() {
        self.locationLabel.textAlignment = .center
        self.locationLabel.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        self.temperatureLabel.font = UIFont.boldSystemFont(ofSize: 50)
        self.weatherDescriptionLabel.font = UIFont.systemFont(ofSize: 24, weight: .heavy)
    }

    func configureCellData() {
        self.locationLabel.text = "California"
        self.temperatureLabel.text = "32°"
        self.weatherDescriptionLabel.text = "Sunny"
        self.highTemperatureLabel.text = "32°"
        self.lowTemperatureLabel.text = "32°"
    }
}
