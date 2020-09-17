//
//  WeatherDownloader.swift
//  WeatherTestcase
//
//  Created by Alexey Sergeev on 9/16/20.
//  Copyright © 2020 Alexey Sergeev. All rights reserved.
//

import Foundation

struct WeatherSaver {
    static var weather: ResultWeather?
}

class WeatherDownloader {
    
    class func getWeatherAt(lat: Double, lon: Double, completion: @escaping ()->()) {
       
    NetworkService.shared.getWeather(lat: lat, lon: lon) { (result) in
       
        switch result {
        case .success(let weather):
            WeatherSaver.weather = weather
            completion()
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
  }
}
