//
//  UIImageView+Extensions.swift
//  WeatherPal
//
//  Created by Prem Shankar Rajagopalan Nayar on 9/4/23.
//

import Foundation
import UIKit

extension UIImageView {
    static let loadingViewTag = 123

    func loadImageFromUrl(urlString: String, completion: @escaping () -> Void) {
        guard let url = URL(string: urlString) else {
            return
        }
        DispatchQueue.main.async { [weak self] in
            if let imgData = try? Data(contentsOf: url) {
                if let img = UIImage(data: imgData) {
                    self?.image = img
                    completion()
                }
            }
        }
    }

    func showLoading(style: UIActivityIndicatorView.Style = .medium) {
        var loading = viewWithTag(UIImageView.loadingViewTag) as? UIActivityIndicatorView
        if loading == nil {
            loading = UIActivityIndicatorView(style: style)
        }
        
        loading?.translatesAutoresizingMaskIntoConstraints = false
        loading!.startAnimating()
        loading!.hidesWhenStopped = true
        loading?.tag = UIImageView.loadingViewTag
        addSubview(loading!)
        loading?.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        loading?.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    func stopLoading() {
        let loading = viewWithTag(UIImageView.loadingViewTag) as? UIActivityIndicatorView
        loading?.stopAnimating()
        loading?.removeFromSuperview()
    }
}
