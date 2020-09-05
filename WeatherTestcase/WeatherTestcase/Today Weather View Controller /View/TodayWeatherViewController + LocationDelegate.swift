//
//  TodayViewController + LocationDelegate.swift
//  WeatherTestcase
//
//  Created by Alexey Sergeev on 9/5/20.
//  Copyright © 2020 Alexey Sergeev. All rights reserved.
//

import CoreLocation

extension TodayWeatherViewController: CLLocationManagerDelegate {
    
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
