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
    var todayWeatherViewModel: TodayWeatherViewModel?
   
    var startLocation: CLLocation? {
        didSet {
            presentWeatherOfCurrentLocation()
            defineCurrentCity()
        }
    }
    
    init(viewModel: TodayWeatherViewModel) {
        self.todayWeatherViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startLocation = CLLocation()
        
        setupInternalViewForMainView()
        getCurrentLocation()
        self.todayWeatherView.shareButton.addTarget(self, action: #selector(handleShareButton), for: .touchUpInside)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.topItem?.title = "Today"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(handleSearchCity))
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let navVC = tabBarController?.viewControllers![1] as! UINavigationController
        let forecatVC = navVC.topViewController as! ForecastWeatherCollectionViewController;()
        forecatVC.navigationController?.navigationBar.topItem?.title = self.todayWeatherView.cityAndCountryLabel.text
    }
    
    
    @objc private func handleSearchCity() {
        let searchVC = SearchCityViewController()
        
        navigationController?.pushViewController(searchVC, animated: true)
    }
    
     private func setupInternalViewForMainView() {

        todayWeatherView = TodayWeatherView()
        view.addSubview(todayWeatherView)
        NSLayoutConstraint.activate([
            todayWeatherView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            todayWeatherView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            todayWeatherView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            todayWeatherView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    private func presentWeatherOfCurrentLocation() {

        guard let currentLocation = startLocation else { return }

        let lat = currentLocation.coordinate.latitude
        let lon = currentLocation.coordinate.longitude
        
        todayWeatherViewModel?.getWeatherAt(lat: lat, lon: lon, completion: { [weak self] in
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                
               self?.todayWeatherView.temperatureAndWeatherStateLabel.text =
               self?.todayWeatherViewModel?.temperatureAndWeatherState
               
               self?.todayWeatherView.humidityLabel.text =
               self?.todayWeatherViewModel?.humidity

               self?.todayWeatherView.weatherStateImageView.image =
               self?.todayWeatherViewModel?.weatherStateImageView

               self?.todayWeatherView.precipitationLabel.text =
               self?.todayWeatherViewModel?.precipitation

               self?.todayWeatherView.pressureLabel.text =
               self?.todayWeatherViewModel?.pressure

               self?.todayWeatherView.windSpeedLabel.text =
               self?.todayWeatherViewModel?.windSpeed

               self?.todayWeatherView.compassLabel.text =
               self?.todayWeatherViewModel?.compass
               self?.todayWeatherView.activityIndicator.stopAnimating()
                
               self?.todayWeatherView.compassLabel.shouldShowTip()
               self?.todayWeatherView.humidityLabel.shouldShowTipWithText("Humidity")
               self?.todayWeatherView.precipitationLabel.shouldShowTipWithText("Precipitation")
               self?.todayWeatherView.pressureLabel.shouldShowTipWithText("Pressure")
               self?.todayWeatherView.windSpeedLabel.shouldShowTipWithText("Wind speed")
            })
        })
     }

    required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
    }
}


