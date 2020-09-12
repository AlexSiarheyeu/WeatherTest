//
//  Weather.swift
//  WeatherTestcase
//
//  Created by Alexey Sergeev on 9/3/20.
//  Copyright © 2020 Alexey Sergeev. All rights reserved.
//

import Foundation

struct ResultWeather: Codable {
    let timezone: String
    let current: Current
    var hourly: [Hourly]
    var daily: [Daily]
}

struct Current: Codable {
    let dt: Int
    let temp: Double
    let pressure: Int
    let humidity: Int
    let wind_speed: Double
    let weather: [Weather]
}

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct Hourly: Codable {
    let dt: Int
    let temp: Double
    let pressure: Int
    let humidity: Int
    let wind_speed: Double
    let weather: [Weather]
}

struct Daily: Codable {
    let dt: Int
    let pressure: Int
    let humidity: Int
    let wind_speed: Double
    let weather: [Weather]
}



