//
//  WeatherViewModel.swift
//  WeatherTestcase
//
//  Created by Alexey Sergeev on 9/5/20.
//  Copyright © 2020 Alexey Sergeev. All rights reserved.
//

import UIKit
import CoreLocation

var weatherstatic: ResultWeather?

class TodayWeatherViewModel {

   
    var networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    var temperatureAndWeatherState: String {
        guard let temperature = weatherstatic?.current.temp.toCelsius() else { return ""}
        guard let weatherState = weatherstatic?.current.weather[0] else { return ""}
        return "\(String(format: "%.0f", temperature)) ℃ | \(weatherState.main)"
    }
    
    var humidity: String {
        guard let hum = weatherstatic?.current.humidity else { return ""}
        return "\(hum) %"
    }
    
    var precipitation: String {
        return "\(1000) mm"
    }
    
    var pressure: String {
        guard let hpa = weatherstatic?.current.pressure else { return ""}
        return "\(hpa) hPa"
    }
    
    var windSpeed: String {
        let windSpeed = weatherstatic?.current.wind_speed
        guard let kmh = windSpeed?.toKmh() else {return ""}
        let newSpeed = String(format: "%.1f", kmh)
        return "\(newSpeed) km/h"
    }
    
    var compass: String {
        return "SE"
    }
    
    var weatherStateImageView: UIImage  {
        guard let weatherObject = weatherstatic?.current.weather[0].main else {return UIImage()}
        return UIImage.weatherIcon(of: weatherObject) ?? UIImage()
    }
    
    func getWeatherAt(lat: Double, lon: Double, completion: @escaping ()->()) {
           
        NetworkService.shared.getWeather(lat: lat, lon: lon) { (result) in
           
            switch result {
            case .success(let weather):
                weatherstatic = weather
                completion()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        }
    }
