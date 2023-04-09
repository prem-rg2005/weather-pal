//
//  UIImageView+Extensions.swift
//  WeatherPal
//
//  Created by Prem Shankar Rajagopalan Nayar on 9/4/23.
//

import Foundation
import UIKit

extension UIImageView {
    func loadImageFromUrl(urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        DispatchQueue.main.async { [weak self] in
            if let imgData = try? Data(contentsOf: url) {
                if let img = UIImage(data: imgData) {
                    self?.image = img
                }
            }
        }
    }
}
