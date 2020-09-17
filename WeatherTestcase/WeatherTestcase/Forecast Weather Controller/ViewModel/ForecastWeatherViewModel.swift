//
//  ForecastWeatherViewModel.swift
//  WeatherTestcase
//
//  Created by Alexey Sergeev on 9/6/20.
//  Copyright © 2020 Alexey Sergeev. All rights reserved.
//

import UIKit

class ForecastWeatherViewModel  {
    
     private let dateFormatter = DateFormatter()
    
     typealias currentDayIndex = Int
     typealias forecast = WeatherSaver
    
     lazy var sectionsOfDays = [
        [forecast.weather?.daily[currentDayIndex(0)]],
        [forecast.weather?.daily[currentDayIndex(1)]],
        [forecast.weather?.daily[currentDayIndex(2)]],
        [forecast.weather?.daily[currentDayIndex(3)]],
        [forecast.weather?.daily[currentDayIndex(4)]]
        ]
        
     func getTime(_ section: Int, _ row: Int) -> String {
        
          let hour = sectionsOfDays[section][row]
         
          guard let hourlyTime = hour?.dt else { return ""}
            
             let time = Date(timeIntervalSince1970: TimeInterval(hourlyTime))
             dateFormatter.dateFormat = "MMM d, yyyy" //"hh:mm a"
             let date = dateFormatter.string(from: time as Date)
             return date
     }
    
     func week(for index: Int) -> String {
         let dateFormatter = DateFormatter()
         dateFormatter.dateFormat = "  EEEE"
         guard let f = forecast.weather?.daily[index].dt else {return ""}
         let date = Date(timeIntervalSince1970: TimeInterval(f))
         return dateFormatter.string(from: date)
     }
     
     func temperature(_ section: Int, _ row: Int) -> String {
        let hour = sectionsOfDays[section][row]
        guard let temp = hour?.temp.day.toCelsius() else {return ""}
        return  "\(String(format: "%.0f", temp)) ℃"
     }
     
     func weatherState(_ section: Int, _ row: Int) -> String {
         let hour = sectionsOfDays[section][row]
         guard let state = hour?.weather[0].description else { return "" }
        return state.capitalizingFirstLetter()
     }
     
     func getWeatherStateImage(_ section: Int, _ row: Int) -> UIImage {
         let hour = sectionsOfDays[section][row]
         guard let state = hour?.weather[0].main else { return UIImage() }
         return UIImage.weatherIcon(of: state) ?? UIImage()
     }
 }
