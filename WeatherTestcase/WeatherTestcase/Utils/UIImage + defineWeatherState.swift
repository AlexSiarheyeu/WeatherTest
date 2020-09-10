//
//  UIImage + defineWeatherState.swift
//  WeatherTestcase
//
//  Created by Alexey Sergeev on 9/10/20.
//  Copyright © 2020 Alexey Sergeev. All rights reserved.
//

import UIKit

extension UIImage {
    
    class func weatherIcon(of name: String) -> UIImage? {
        switch name {
        case "Clear":
            return UIImage(named: "ClearSky")
        case "Rain":
            return UIImage(named: "Rain")
        case "Sun":
            return UIImage(named: "sun")
        case "Haze":
            return UIImage(named: "Haze")?.withTintColor(.gray, renderingMode: .alwaysOriginal)
        case "Clouds":
            return UIImage(named: "Clouds")
        default:
            return UIImage(named: "Haze")
        }
    }
}
