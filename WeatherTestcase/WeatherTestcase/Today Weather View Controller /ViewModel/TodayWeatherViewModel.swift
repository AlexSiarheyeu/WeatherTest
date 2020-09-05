//
//  WeatherViewModel.swift
//  WeatherTestcase
//
//  Created by Alexey Sergeev on 9/5/20.
//  Copyright © 2020 Alexey Sergeev. All rights reserved.
//

import UIKit

enum Condition: String {
    case Clouds, Haze, Rain, Clear, Sun
}

struct TodayWeatherViewModel {
    
    let timezone: String
    let temperatureAndWeatherState: String
    var weatherStateImageView: UIImage = UIImage()
    let humidity: String
    let precipitation: String
    let pressure: String
    let windSpeed: String
    let compass: String
    
    init(weather: ResultWeather) {
        
        let city = weather.timezone
        let newCity = city.components(separatedBy: "/")[1]
        let newStringCity = newCity.replacingOccurrences(of: "_", with: " ", options: .literal, range: nil)
        
        self.timezone = newStringCity
        
        let temperature = weather.current.temp
        let weatherState = weather.current.weather
        
        let weatherObject = weatherState[0]
            
        let celsiusTemperature = temperature - 273.15

        self.temperatureAndWeatherState = "\(String(format: "%.0f", celsiusTemperature)) ℃ | \(weatherObject.main)"

        self.humidity = "\(weather.current.humidity) %"
                    
        let precipitationMM = weather.minutely
        let indexPrecipitation = precipitationMM[0]
        let mmPrecipitation = indexPrecipitation.precipitation
        let precString = String(format: "%.1f", mmPrecipitation)
        
        self.precipitation = "\(precString) mm"
        self.pressure = "\(weather.current.pressure) hPa"

        let windSpeed = weather.current.wind_speed
        let kmh = windSpeed * 3.6
        let newSpeed = String(format: "%.1f", kmh)
        
        self.windSpeed = "\(newSpeed) km/h"
        
        self.compass = "SE"
        
        self.getCondition(weatherObject.main)
    }
    
    mutating private func getCondition(_ state: Condition.RawValue) {
        
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
            break
        }
    }
}

