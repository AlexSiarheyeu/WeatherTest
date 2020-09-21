//
//  ForecastWeatherCellViewModel.swift
//  WeatherTestcase
//
//  Created by Alexey Sergeev on 9/21/20.
//  Copyright © 2020 Alexey Sergeev. All rights reserved.
//

import Foundation
import UIKit.UIImage

protocol ForecastWeatherCellViewModelType: class {
    
    func getCurrentDay() -> String
    func getCurrentDate() -> String
    func getTemperature() -> String
    func getWeatherCondition() -> String
    func getWeatherConditionImage() -> UIImage
}

class ForecastWeatherCellViewModel: ForecastWeatherCellViewModelType {
    
    private var daily: Daily?
    private let dateFormatter = DateFormatter()
    
    init(weather: Daily?) {
        self.daily = weather
    }
    
    func getCurrentDay() -> String {
           
       let dateFormatter = DateFormatter()
       dateFormatter.dateFormat = "  EEEE"
       guard let f = daily?.dt else {return ""}
       let date = Date(timeIntervalSince1970: TimeInterval(f))
       return dateFormatter.string(from: date)
    }
           
    func getCurrentDate() -> String {
           
       guard let hourlyTime = daily?.dt else { return ""}
       let time = Date(timeIntervalSince1970: TimeInterval(hourlyTime))
       dateFormatter.dateFormat = "MMM d, yyyy" //"hh:mm a"
       let date = dateFormatter.string(from: time as Date)
       return date
    }
       
    func getTemperature() -> String {
           
       guard let temp = daily?.temp.day.toCelsius() else {return ""}
       return  "\(String(format: "%.0f", temp)) ℃"
    }
        
    func getWeatherCondition() -> String {
           
       guard let state = daily?.weather[0].description else { return "" }
       return state.capitalizingFirstLetter()
    }
        
    func getWeatherConditionImage() -> UIImage {
           
       guard let state = daily?.weather[0].main else { return UIImage() }
       return UIImage.weatherIcon(of: state) ?? UIImage()
    }
}
