//
//  ViewController.swift
//  WeatherTestcase
//
//  Created by Alexey Sergeev on 9/3/20.
//  Copyright © 2020 Alexey Sergeev. All rights reserved.
//

import UIKit
import CoreLocation

class TodayWeatherViewController: UIViewController {

    var locationManager: CLLocationManager?
    var startLocation: CLLocation?
    var todayWeatherView: TodayWeatherView!

    var weatherResultViewModel: TodayWeatherViewModel? {
        didSet {
            setupInfoAboutWeatherForView()
        }
    }
    
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
    
    private func setupInfoAboutWeatherForView() {
        
        DispatchQueue.main.async { [weak self] in
            
            self?.todayWeatherView.cityAndCountryLabel.text = self?.weatherResultViewModel?.timezone
            
            self?.todayWeatherView.temperatureAndWeatherStateLabel.text = self?.weatherResultViewModel?.temperatureAndWeatherState
            
            self?.todayWeatherView.humidityLabel.text = self?.weatherResultViewModel?.humidity
            
            self?.todayWeatherView.weatherStateImageView.image = self?.weatherResultViewModel?.weatherStateImageView
            
            self?.todayWeatherView.precipitationLabel.text = self?.weatherResultViewModel?.precipitation
            
            self?.todayWeatherView.pressureLabel.text = self?.weatherResultViewModel?.pressure
            
            self?.todayWeatherView.windSpeedLabel.text = self?.weatherResultViewModel?.windSpeed
            
            self?.todayWeatherView.compassLabel.text = self?.weatherResultViewModel?.compass
        }
    }
    
    private func setupInternalViewForMainView() {
        
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
                   let weath = weather.map({return TodayWeatherViewModel(weather: $0)})
               
                   let new = try weath.get()
                
                   self.weatherResultViewModel = new
//                   self.weatherResultViewModel?.sortDailyArray()
//                   self.weatherResultViewModel?.sortHourlyArray()
                
               } catch {}
           }
        }
}


