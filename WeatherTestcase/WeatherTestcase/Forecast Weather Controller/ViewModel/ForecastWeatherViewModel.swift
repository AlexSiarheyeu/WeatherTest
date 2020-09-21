//
//  ForecastWeatherViewModel.swift
//  WeatherTestcase
//
//  Created by Alexey Sergeev on 9/6/20.
//  Copyright © 2020 Alexey Sergeev. All rights reserved.
//

import Foundation

protocol ForecastWeatherViewModelType {
    
    var numberOfItems: Int { get }
    var numberOfSections: Int { get }
    func configureCell(_ section: Int, _ row: Int) -> ForecastWeatherCellViewModel?
}

class ForecastWeatherViewModel: ForecastWeatherViewModelType {
    
    typealias currentDayIndex = Int
    typealias forecast = WeatherSaver
    
    var numberOfSections: Int {
        sectionsOfDays.count
    }
    
    var numberOfItems: Int {
        sectionsOfDays[0].count
    }
    
     lazy var sectionsOfDays = [
        [forecast.weather?.daily[currentDayIndex(0)]],
        [forecast.weather?.daily[currentDayIndex(1)]],
        [forecast.weather?.daily[currentDayIndex(2)]],
        [forecast.weather?.daily[currentDayIndex(3)]],
        [forecast.weather?.daily[currentDayIndex(4)]]
        ]
    
    func configureCell(_ section: Int, _ row: Int) -> ForecastWeatherCellViewModel? {
        let weather = sectionsOfDays[section][row]
        return ForecastWeatherCellViewModel(weather: weather)
    }
 }
