//
//  TodayViewController + LocationDelegate.swift
//  WeatherTestcase
//
//  Created by Alexey Sergeev on 9/5/20.
//  Copyright © 2020 Alexey Sergeev. All rights reserved.
//

import CoreLocation

extension TodayWeatherViewController: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
           
       if let location = locations.first {
           startLocation = location
       }
        todayWeatherView.activityIndicator.startAnimating()
    }
       
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
           
       switch status {

       case .authorizedWhenInUse:
           locationManager?.startUpdatingLocation()
       default:
           break
       }
    }
    
    func defineCurrentCity() {
        
       CLGeocoder().reverseGeocodeLocation(startLocation, completionHandler: { [weak self]
            placemarks, error in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            if let city = placemarks?.first?.locality {
                self?.todayWeatherView.cityAndCountryLabel.text = city
            }
        })
    }
       
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {}
}
