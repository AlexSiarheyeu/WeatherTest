//
//  ViewController.swift
//  WeatherTestcase
//
//  Created by Alexey Sergeev on 9/3/20.
//  Copyright © 2020 Alexey Sergeev. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    var locationManager: CLLocationManager?
    var startLocation: CLLocation?
    
    var weatherResult: ResultWeather? {
        didSet {
            setupDataToView()
        }
    }
    
    var todayWeatherView: TodayWeatherView!

   override func viewDidLoad() {
       super.viewDidLoad()
    
       getCurrentLocation()
       fetchWeather()
       setupInternalViewForMainView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.topItem?.title = "Today"
    }
    
    func setupDataToView() {
        
        DispatchQueue.main.async { [weak self] in
            
            if let city = self?.weatherResult?.timezone {
                
                let newCity = city.components(separatedBy: "/")[1]
                let newStringCity = newCity.replacingOccurrences(of: "_", with: " ", options: .literal, range: nil)
                
                self?.todayWeatherView.cityAndCountryLabel.text = newStringCity
            }
            
            if let temperature = self?.weatherResult?.current.temp,
               let currentStateWeather = self?.weatherResult?.current.weather {
                
                let weather = currentStateWeather[0]
                let celsiusTemperature = temperature - 273.15
                
                self?.todayWeatherView.temperatureAndStateWeatherLabel.text = "\(String(format: "%.0f", celsiusTemperature)) ℃ | \(weather.main)"
            }
            
            if let humidity = self?.weatherResult?.current.humidity {
                self?.todayWeatherView.humidityLabel.text = "\(humidity) %"
            }
            
            if let precipitation = self?.weatherResult?.minutely {
                
                let indexPrecipitation = precipitation[0]
                let mmPrecipitation = indexPrecipitation.precipitation
                let precString = String(format: "%.1f", mmPrecipitation)
                
                self?.todayWeatherView.precipitationLabel.text = "\(precString) mm"
            }
            
            if let pressure = self?.weatherResult?.current.pressure {
                
                self?.todayWeatherView.pressureLabel.text = "\(pressure) hPa"
            }
            
            if let windSpeed = self?.weatherResult?.current.wind_speed {
                let kmh = windSpeed * 3.6
                let newSpeed = String(format: "%.1f", kmh)
                self?.todayWeatherView.windSpeedLabel.text = "\(newSpeed) km/h"
            }
        }
    }
    
    func setupInternalViewForMainView() {
        
        todayWeatherView = TodayWeatherView()
        view.addSubview(todayWeatherView)
        todayWeatherView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            todayWeatherView.topAnchor.constraint(equalTo: view.topAnchor),
            todayWeatherView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            todayWeatherView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            todayWeatherView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }

    func fetchWeather() {
        
        guard let currentLocation = startLocation else { return }

        let lat = currentLocation.coordinate.latitude
        let lon = currentLocation.coordinate.longitude
        
        NetworkService.shared.getWeather(lat: lat, lon: lon) { (weather) in
              
               do {
                   let weath = try weather.get()
                       self.weatherResult = weath
                       self.weatherResult?.sortDailyArray()
                       self.weatherResult?.sortHourlyArray()
                
               } catch {}
           }
        }
}

extension ViewController: CLLocationManagerDelegate {
    
    func getCurrentLocation() {
           
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestLocation()
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse || CLLocationManager.authorizationStatus() == .authorizedAlways {
            startLocation = locationManager?.location
            
        }
    }

    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
            if let location = locations.first {
                startLocation = location
            }
        
            fetchWeather()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        switch status {

        case .authorizedWhenInUse:
            locationManager?.startUpdatingLocation()
        default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    
    }
}
