//
//  Weather.swift
//  WeatherTestcase
//
//  Created by Alexey Sergeev on 9/3/20.
//  Copyright © 2020 Alexey Sergeev. All rights reserved.
//

import Foundation

struct ResultWeather: Decodable {
    let timezone: String
    let current: Current
    var hourly: [Hourly]
    var daily: [Daily]
}

struct Current: Decodable {
    let dt: Int
    let temp: Double
    let pressure: Int
    let humidity: Int
    let wind_speed: Double
    let weather: [Weather]
    
}

struct Weather: Decodable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct Hourly: Decodable {
    let dt: Int
    let temp: Double
    let pressure: Int
    let humidity: Int
    let wind_speed: Double
    let weather: [Weather]
}

struct Daily: Decodable {
    let dt: Int
    let pressure: Int
    let humidity: Int
    let wind_speed: Double
    let weather: [Weather]
    let temp: Temperature
}


struct Temperature: Decodable {
    var day: Double
}



