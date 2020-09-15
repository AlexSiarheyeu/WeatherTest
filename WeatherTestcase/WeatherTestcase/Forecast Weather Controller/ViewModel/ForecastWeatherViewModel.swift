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
    
     typealias currentTimeIndex = Int
     typealias forecast = WeatherSaver
    
     lazy var sectionsOfDays = [
        [forecast.weather?.hourly[currentTimeIndex(0)], forecast.weather?.hourly[currentTimeIndex(3)],   // 1 day
         forecast.weather?.hourly[currentTimeIndex(6)], forecast.weather?.hourly[currentTimeIndex(9)],
         forecast.weather?.hourly[currentTimeIndex(12)], forecast.weather?.hourly[currentTimeIndex(15)]],
      
         [forecast.weather?.hourly[currentTimeIndex(27)], forecast.weather?.hourly[currentTimeIndex(30)], // 2 day
          forecast.weather?.hourly[currentTimeIndex(33)], forecast.weather?.hourly[currentTimeIndex(36)],
          forecast.weather?.hourly[currentTimeIndex(39)]]
     ]
     
     
     func getTime(_ section: Int, _ row: Int) -> String {
        
          let hour = sectionsOfDays[section][row]
         
          guard let hourlyTime = hour?.dt else { return ""}
            
             let time = Date(timeIntervalSince1970: TimeInterval(hourlyTime))

             dateFormatter.dateFormat = "hh:mm a"
             let dateAsString = dateFormatter.string(from: time as Date)
         
             dateFormatter.dateFormat = "h:mm a"
             let date = dateFormatter.date(from: dateAsString)
         
             dateFormatter.dateFormat = "HH:mm"
             let finalDate = dateFormatter.string(from: date!)
             return finalDate
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
        guard let temp = hour?.temp else {return ""}
        return  "\(String(format: "%.0f", temp - 273.15)) ℃"
     }
     
     func weatherState(_ section: Int, _ row: Int) -> String {
         let hour = sectionsOfDays[section][row]
         guard let state = hour?.weather[0].description else { return "" }
         return state
     }
     
     func getWeatherStateImage(_ section: Int, _ row: Int) -> UIImage {
         let hour = sectionsOfDays[section][row]
         guard let state = hour?.weather[0].main else { return UIImage() }
         return UIImage.weatherIcon(of: state) ?? UIImage()
     }
 }
