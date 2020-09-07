//
//  WeatherViewModel.swift
//  WeatherTestcase
//
//  Created by Alexey Sergeev on 9/5/20.
//  Copyright © 2020 Alexey Sergeev. All rights reserved.
//

import UIKit
import CoreLocation

extension Double {
    func convertToCelsius() -> Double {
        return (self - 273.15)
    }
    
    func convertMphToKmh() -> Double {
        return self * 3.6
    }
}

enum Condition: String {
    case Clouds, Haze, Rain, Clear, Sun
}

class TodayWeatherViewModel {

    var startLocation: CLLocation?
    var locationManager: CLLocationManager?
    
    var temperatureAndWeatherState: String
    var weatherStateImageView: UIImage = UIImage()
    var humidity: String
    var precipitation: String
    var pressure: String
    var windSpeed: String
    var compass: String
    var weather: ResultWeather?
    
    init(weather: ResultWeather) {

        let temperature = weather.current.temp.convertToCelsius()
        let weatherState = weather.current.weather[0]
        self.temperatureAndWeatherState = "\(String(format: "%.0f", temperature)) ℃ | \(weatherState.main)"
        
        self.humidity = "\(weather.current.humidity) %"
                    
        let precipitationIndex = weather.minutely[0]
        let mmPrecipitation = precipitationIndex.precipitation
        let precString = String(format: "%.1f", mmPrecipitation)
        
        self.precipitation = "\(precString) mm"
        self.pressure = "\(weather.current.pressure) hPa"

        let windSpeed = weather.current.wind_speed
        let newSpeed = String(format: "%.1f", windSpeed.convertMphToKmh())
        self.windSpeed = "\(newSpeed) km/h"
        
        self.compass = "SE"
        
        let weatherObject = weather.current.weather[0].main
        self.getCondition(weatherObject)
    }
    
     private func getCondition(_ state: Condition.RawValue) {
        
        switch state{
        
        case Condition.Clouds.rawValue:
            self.weatherStateImageView = UIImage(named: "Clouds")!
            
        case Condition.Haze.rawValue:
             let image = UIImage(named: "Haze")?.withTintColor(.gray, renderingMode: .alwaysOriginal)
            self.weatherStateImageView = image!
            
        case Condition.Rain.rawValue:
            self.weatherStateImageView = UIImage(named: "Rain")!
            
        case Condition.Clear.rawValue:
            self.weatherStateImageView = UIImage(named: "ClearSky")!
            
        case Condition.Sun.rawValue:
            self.weatherStateImageView = UIImage(named: "sun")!
            
        default:
            self.weatherStateImageView = UIImage(named: "Haze")!
        }
    }
}

