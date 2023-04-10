//
//  HourlyTableCell.swift
//  WeatherPal
//
//  Created by Prem Shankar Rajagopalan Nayar on 8/4/23.
//

import UIKit

class HourlyTableCell: UITableViewCell {
    @IBOutlet weak var hourlyCollectionView: UICollectionView!

    static let identifier = "HourlyTableCell"
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    var hourlyWeatherData: [Current] = []

    override func awakeFromNib() {
        super.awakeFromNib()
        hourlyCollectionView.backgroundColor = .clear
        hourlyCollectionView.register(HourlyCollectionCell.nib(), forCellWithReuseIdentifier: HourlyCollectionCell.identifier)
        hourlyCollectionView.delegate = self
        hourlyCollectionView.dataSource = self
    }

    func configureCollectionView(with hourlyWeatherData: [Current]) {
        self.hourlyWeatherData = hourlyWeatherData
        self.hourlyCollectionView.reloadData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension HourlyTableCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hourlyWeatherData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = hourlyCollectionView.dequeueReusableCell(withReuseIdentifier: HourlyCollectionCell.identifier, for: indexPath) as! HourlyCollectionCell
        cell.configureData(hourlyWeather: hourlyWeatherData[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 70, height: 100)
    }
}
