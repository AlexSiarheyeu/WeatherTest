//
//  Double + func.swift
//  WeatherTestcase
//
//  Created by Alexey Sergeev on 9/7/20.
//  Copyright © 2020 Alexey Sergeev. All rights reserved.
//

import Foundation

extension Double {
    func toCelsius() -> Double {
        return (self - 273.15)
    }
    
    func toKmh() -> Double {
        return self * 3.6
    }
}
