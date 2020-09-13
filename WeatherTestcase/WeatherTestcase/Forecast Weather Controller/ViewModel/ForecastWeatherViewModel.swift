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
     
     lazy var sectionsOfDays = [
         [weatherstatic?.hourly[0], weatherstatic?.hourly[3], weatherstatic?.hourly[6], weatherstatic?.hourly[9],
          weatherstatic?.hourly[12], weatherstatic?.hourly[15], weatherstatic?.hourly[18]],
      
         [weatherstatic?.hourly[21], weatherstatic?.hourly[24], weatherstatic?.hourly[27], weatherstatic?.hourly[30],
          weatherstatic?.hourly[33], weatherstatic?.hourly[36], weatherstatic?.hourly[39]],
      
         [weatherstatic?.hourly[0], weatherstatic?.hourly[3], weatherstatic?.hourly[6], weatherstatic?.hourly[9],
          weatherstatic?.hourly[12], weatherstatic?.hourly[15], weatherstatic?.hourly[18]],
              
         [weatherstatic?.hourly[21], weatherstatic?.hourly[24], weatherstatic?.hourly[27], weatherstatic?.hourly[30],
          weatherstatic?.hourly[33], weatherstatic?.hourly[36], weatherstatic?.hourly[39]],
         
         [weatherstatic?.hourly[42], weatherstatic?.hourly[45], weatherstatic?.hourly[47]]
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
         guard let f = weatherstatic?.daily[index].dt else {return ""}
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

