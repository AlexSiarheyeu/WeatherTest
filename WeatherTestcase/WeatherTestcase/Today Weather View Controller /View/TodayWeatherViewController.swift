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
    
    var todayWeatherView: TodayWeatherView!
    var locationManager: CLLocationManager?
    
    let shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Share", for: .normal)
        button.setTitleColor(.systemRed, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22)
        return button
    }()
    
    var startLocation: CLLocation? {
        didSet {
            fetchCity()
        }
    }
    var weatherResultViewModel: TodayWeatherViewModel? {
        didSet {
            setupInfoAboutWeatherForView()
        }
    }
    
   override func viewDidLoad() {
       super.viewDidLoad()
       setupInternalViewForMainView()
       getCurrentLocation()
       shareButton.addTarget(self, action: #selector(handleShareButton), for: .touchUpInside)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.navigationBar.topItem?.title = "Today"
        
    }

    @objc func handleShareButton() {
        guard let text = self.weatherResultViewModel?.temperatureAndWeatherState else {return}
        
        let activityViewController = UIActivityViewController(activityItems: [text], applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view

        activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook ]

        self.present(activityViewController, animated: true, completion: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let navVC = tabBarController?.viewControllers![1] as! UINavigationController
        let forecatVC = navVC.topViewController as! ForecarWeatherCollectionViewController;()
        
        forecatVC.navigationController?.navigationBar.topItem?.title = self.todayWeatherView.cityAndCountryLabel.text
    }
    
    private func setupInfoAboutWeatherForView() {

        DispatchQueue.main.async { [weak self] in

            self?.todayWeatherView.temperatureAndWeatherStateLabel.text = self?.weatherResultViewModel?.temperatureAndWeatherState

            self?.todayWeatherView.humidityLabel.text = self?.weatherResultViewModel?.humidity

            self?.todayWeatherView.weatherStateImageView.image = self?.weatherResultViewModel?.weatherStateImageView

            self?.todayWeatherView.precipitationLabel.text = self?.weatherResultViewModel?.precipitation

            self?.todayWeatherView.pressureLabel.text = self?.weatherResultViewModel?.pressure

            self?.todayWeatherView.windSpeedLabel.text = self?.weatherResultViewModel?.windSpeed

            self?.todayWeatherView.compassLabel.text = self?.weatherResultViewModel?.compass
        }
    }
    
     func setupInternalViewForMainView() {

        todayWeatherView = TodayWeatherView()
        view.addSubview(todayWeatherView)
        todayWeatherView.translatesAutoresizingMaskIntoConstraints = false
        todayWeatherView.addSubview(shareButton)
        
        NSLayoutConstraint.activate([
            todayWeatherView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            todayWeatherView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            todayWeatherView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            todayWeatherView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            shareButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            shareButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    
    func fetchWeather() {

          guard let currentLocation = startLocation else { return }

          let lat = currentLocation.coordinate.latitude
          let lon = currentLocation.coordinate.longitude

          NetworkService.shared.getWeather(lat: lat, lon: lon) { (weather) in
           
           let weath = weather.map({TodayWeatherViewModel(weather: $0)})
           
              switch weath {

              case .success(let convertWeather):
                print(convertWeather)
                  self.weatherResultViewModel = convertWeather
              case .failure(let error):
                  print(error)
              }
        }
     }
    
    private func fetchCity() {
        guard let currentLocation = startLocation else { return }

        CLGeocoder().reverseGeocodeLocation(currentLocation, completionHandler: {
            placemarks, error in
            if let error = error {
                dump(error)
            }
            else if let city = placemarks?.first?.locality {
              
                self.todayWeatherView.cityAndCountryLabel.text = city
            }
        })
    }
}


