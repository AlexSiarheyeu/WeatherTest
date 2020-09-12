//
//  WeatherViewModel.swift
//  WeatherTestcase
//
//  Created by Alexey Sergeev on 9/5/20.
//  Copyright © 2020 Alexey Sergeev. All rights reserved.
//

import UIKit
import CoreLocation

enum Condition: String {
    case Clouds, Haze, Rain, Clear, Sun
}

class TodayWeatherViewModel {

    var weather: ResultWeather?
    var networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    var temperatureAndWeatherState: String {
        guard let temperature = weather?.current.temp.convertToCelsius() else { return ""}
        guard let weatherState = weather?.current.weather[0] else { return ""}
        return "\(String(format: "%.0f", temperature)) ℃ | \(weatherState.main)"
    }
    
    var humidity: String {
        guard let hum = weather?.current.humidity else { return ""}
        return "\(hum) %"
    }
    
    var precipitation: String {
        let precipitationIndex = weather?.minutely[0]
        guard let mmPrecipitation = precipitationIndex?.precipitation else {return ""}
        let precString = String(format: "%.1f", mmPrecipitation)
        return "\(precString) mm"
    }
    
    var pressure: String {
        guard let hpa = weather?.current.pressure else { return ""}
        return "\(hpa) hPa"
    }
    
    var windSpeed: String {
        let windSpeed = weather?.current.wind_speed
        guard let kmh = windSpeed?.convertMphToKmh() else {return ""}
        let newSpeed = String(format: "%.1f", kmh)
        return "\(newSpeed) km/h"
    }
    
    var compass: String {
        return "SE"
    }
    
    var weatherStateImageView: UIImage  {
        guard let weatherObject = weather?.current.weather[0].main else {return UIImage()}
        return UIImage.weatherIcon(of: weatherObject) ?? UIImage()
    }
    
    func getWeatherAt(lat: Double, lon: Double, completion: @escaping ()->()) {
           
        NetworkService.shared.getWeather(lat: lat, lon: lon) { (result) in
           
            switch result {
            case .success(let weather):
                self.weather = weather
                print(weather)
                completion()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        }
    }

    



