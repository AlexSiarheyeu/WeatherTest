//
//  WeatherViewModel.swift
//  WeatherTestcase
//
//  Created by Alexey Sergeev on 9/5/20.
//  Copyright © 2020 Alexey Sergeev. All rights reserved.
//

import UIKit
import CoreLocation

struct WeatherSaver {
    static var weather: ResultWeather?
}

class TodayWeatherViewModel {
    
    var networkService: NetworkService
    var vc: TodayWeatherViewController!
    
    init(networkService: NetworkService) {
        self.networkService = networkService
        vc = TodayWeatherViewController(viewModel: self)
    }
    
    var temperatureAndWeatherState: String {
        guard let temperature = WeatherSaver.weather?.current.temp.toCelsius() else { return ""}
        guard let weatherState = WeatherSaver.weather?.current.weather[0] else { return ""}
        return "\(String(format: "%.0f", temperature)) ℃ | \(weatherState.main)"
    }
    
    var humidity: String {
        guard let hum = WeatherSaver.weather?.current.humidity else { return ""}
        return "\(hum) %"
    }
    
    var precipitation: String {
        return "\(1000) mm"
    }
    
    var pressure: String {
        guard let hpa = WeatherSaver.weather?.current.pressure else { return ""}
        return "\(hpa) hPa"
    }
    
    var windSpeed: String {
        let windSpeed = WeatherSaver.weather?.current.wind_speed
        guard let kmh = windSpeed?.toKmh() else {return ""}
        let newSpeed = String(format: "%.1f", kmh)
        return "\(newSpeed) km/h"
    }
    
    var compass: String {
        return "SE"
    }
    
    var weatherStateImageView: UIImage  {
        guard let weatherObject = WeatherSaver.weather?.current.weather[0].main else {return UIImage()}
        return UIImage.weatherIcon(of: weatherObject) ?? UIImage()
    }
    
    func getWeatherAt(lat: Double, lon: Double, completion: @escaping ()->()) {
           
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


