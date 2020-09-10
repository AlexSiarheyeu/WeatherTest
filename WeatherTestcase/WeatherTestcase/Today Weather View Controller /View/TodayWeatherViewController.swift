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
    let weatherResultViewModel: TodayWeatherViewModel?
    
    var startLocation: CLLocation? {
        didSet {
            presentWeatherOfCurrentLocation()
            defineCurrentCity()
        }
    }
    
    init(viewModel: TodayWeatherViewModel) {
        self.weatherResultViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
   override func viewDidLoad() {
       super.viewDidLoad()
       setupInternalViewForMainView()
       getCurrentLocation()
       self.todayWeatherView.shareButton.addTarget(self, action: #selector(handleShareButton), for: .touchUpInside)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.topItem?.title = "Today"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let navVC = tabBarController?.viewControllers![1] as! UINavigationController
        let forecatVC = navVC.topViewController as! ForecarWeatherCollectionViewController;()
        forecatVC.navigationController?.navigationBar.topItem?.title = self.todayWeatherView.cityAndCountryLabel.text
    }
    
     func setupInternalViewForMainView() {

        todayWeatherView = TodayWeatherView()
        view.addSubview(todayWeatherView)
        
        NSLayoutConstraint.activate([
            todayWeatherView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            todayWeatherView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            todayWeatherView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            todayWeatherView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    func presentWeatherOfCurrentLocation() {

        guard let currentLocation = startLocation else { return }

        let lat = currentLocation.coordinate.latitude
        let lon = currentLocation.coordinate.longitude
        
        weatherResultViewModel?.getWeatherAt(lat: lat, lon: lon, completion: { [weak self] in
            
            DispatchQueue.main.async {
                
                self?.todayWeatherView.temperatureAndWeatherStateLabel.text =
                self?.weatherResultViewModel?.temperatureAndWeatherState
                
                self?.todayWeatherView.humidityLabel.text =
                self?.weatherResultViewModel?.humidity

                self?.todayWeatherView.weatherStateImageView.image =
                self?.weatherResultViewModel?.weatherStateImageView

                self?.todayWeatherView.precipitationLabel.text =
                self?.weatherResultViewModel?.precipitation

                self?.todayWeatherView.pressureLabel.text =
                self?.weatherResultViewModel?.pressure

                self?.todayWeatherView.windSpeedLabel.text =
                self?.weatherResultViewModel?.windSpeed

                self?.todayWeatherView.compassLabel.text =
                self?.weatherResultViewModel?.compass
            }
        })
     }

    required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
}


