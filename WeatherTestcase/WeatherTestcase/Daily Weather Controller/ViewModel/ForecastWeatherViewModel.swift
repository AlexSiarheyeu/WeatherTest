//
//  ForecastWeatherViewModel.swift
//  WeatherTestcase
//
//  Created by Alexey Sergeev on 9/6/20.
//  Copyright © 2020 Alexey Sergeev. All rights reserved.
//

import Foundation

protocol ForecastWeatherViewModelType {
   
    func configureCell(_ section: Int, _ row: Int) -> ForecastWeatherCellViewModel?
    func numberOfItems(_ section: Int) -> Int
    var numberOfSections: Int { get }
}

class ForecastWeatherViewModel: ForecastWeatherViewModelType {
    
    typealias currentDayIndex = Int
    typealias forecast = WeatherSaver
    
    var numberOfSections: Int {
        sectionsOfDays.count
    }
    
    func numberOfItems(_ section: Int) -> Int {
        return sectionsOfDays[section].count
    }
    
    private lazy var sectionsOfDays = [
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
