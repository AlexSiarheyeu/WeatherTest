//
//  Model.swift
//  WeatherTestcaseTests
//
//  Created by Alexey Sergeev on 9/23/20.
//  Copyright © 2020 Alexey Sergeev. All rights reserved.
//

import XCTest
@testable import WeatherTestcase

class Model: XCTestCase {

    func testHourlyModel() {
            
        let weather = Weather(id: 0, main: "foo", description: "bar", icon: "baz")
        let hourly = Hourly(dt: 1, temp: 2, pressure: 3, humidity: 4, wind_speed: 5, weather: [weather])
        
        XCTAssertNotNil(hourly)
        
        XCTAssertEqual(hourly.dt, 1)
        XCTAssertEqual(hourly.temp, 2)
        XCTAssertEqual(hourly.pressure, 3)
        XCTAssertEqual(hourly.humidity, 4)
        XCTAssertEqual(hourly.wind_speed, 5)
        
        XCTAssertTrue(weather.id == 0)
        XCTAssertTrue(weather.main == "foo")
        XCTAssertTrue(weather.description == "bar")
        XCTAssertTrue(weather.icon == "baz")
            
    }
        
    func testDailyModel() {
            
        let weather = Weather(id: 0, main: "foo", description: "bar", icon: "baz")
        let temp = Temperature(day: 0)
        let daily = Daily(dt: 0, pressure: 1, humidity: 2, wind_speed: 3, weather: [weather], temp: temp)
        
        XCTAssertFalse(weather.id != 0)
        XCTAssertFalse(weather.main != "foo")
        XCTAssertFalse(weather.description != "bar")
        XCTAssertFalse(weather.icon != "baz")
        
        XCTAssertEqual(temp.day, 0)
        
        XCTAssertNotNil(weather)
        XCTAssertNotNil(temp)
        XCTAssertNotNil(daily)
        
        XCTAssertEqual(daily.dt, 0)
        XCTAssertEqual(daily.pressure, 1)
        XCTAssertEqual(daily.humidity, 2)
        XCTAssertEqual(daily.wind_speed, 3)
        XCTAssertEqual(daily.temp.day, temp.day)
            
    }
        
    func testCurrentModel() {
            
        let weather = Weather(id: 0, main: "foo", description: "bar", icon: "baz")
        let current = Current(dt: 0, temp: 1, pressure: 2, humidity: 3, wind_speed: 4, wind_deg: 5, weather: [weather])
        
        XCTAssertNotNil(weather)
        XCTAssertNotNil(current)
        
        XCTAssertFalse(current.dt != 0)
        XCTAssertFalse(current.temp != 1)
        XCTAssertFalse(current.pressure != 2)
        XCTAssertFalse(current.humidity != 3)
        XCTAssertFalse(current.wind_speed != 4)
        XCTAssertFalse(current.wind_deg != 5)
        
    }
        
    func testResultWeatherModel() {
            
        let weather = Weather(id: 0, main: "foo", description: "bar", icon: "baz")
        let temp = Temperature(day: 0)
        let current = Current(dt: 0, temp: 1, pressure: 2, humidity: 3, wind_speed: 4, wind_deg: 5, weather: [weather])
        let daily = Daily(dt: 0, pressure: 1, humidity: 2, wind_speed: 3, weather: [weather], temp: temp)
        let hourly = Hourly(dt: 1, temp: 2, pressure: 3, humidity: 4, wind_speed: 5, weather: [weather])

        let resultWeather = ResultWeather(timezone: "foo", current: current, hourly: [hourly], daily: [daily])
        
        XCTAssertNotNil(resultWeather)
        
        XCTAssertFalse(resultWeather.current.dt != current.dt)
        XCTAssertFalse(resultWeather.current.temp != current.temp)
        XCTAssertFalse(resultWeather.current.pressure != current.pressure)
        XCTAssertFalse(resultWeather.current.humidity != current.humidity)
        XCTAssertFalse(resultWeather.current.wind_speed != current.wind_speed)
        XCTAssertFalse(resultWeather.current.wind_deg != current.wind_deg)
        
        XCTAssertEqual(resultWeather.timezone, "foo")
        XCTAssertEqual(resultWeather.hourly[0].dt, 1)
        XCTAssertEqual(resultWeather.hourly[0].temp, 2)
        XCTAssertEqual(resultWeather.hourly[0].pressure, 3)
        XCTAssertEqual(resultWeather.hourly[0].humidity, 4)
        XCTAssertEqual(resultWeather.hourly[0].wind_speed, 5)
        
        XCTAssertTrue(resultWeather.daily[0].dt == 0)
        XCTAssertTrue(resultWeather.daily[0].pressure == 1)
        XCTAssertTrue(resultWeather.daily[0].humidity == 2)
        XCTAssertTrue(resultWeather.daily[0].wind_speed == 3)
        XCTAssertTrue(resultWeather.daily[0].temp.day == temp.day)

    }
}
