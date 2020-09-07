//
//  ForecastWeatherViewModel.swift
//  WeatherTestcase
//
//  Created by Alexey Sergeev on 9/6/20.
//  Copyright © 2020 Alexey Sergeev. All rights reserved.
//

import UIKit

struct ForecastWeatherViewModel  {
    
    var numberOfSections: Int
    
    init(weather: ResultWeather) {
        
        self.numberOfSections = weather.daily.count
        
        
    }
    
}
