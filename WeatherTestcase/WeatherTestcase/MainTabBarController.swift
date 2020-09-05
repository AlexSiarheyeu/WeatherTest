//
//  MainTabBarController.swift
//  WeatherTestcase
//
//  Created by Alexey Sergeev on 9/4/20.
//  Copyright © 2020 Alexey Sergeev. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViewControllers()
    }
    
    func setupViewControllers() {
    
        let todayWeatherController = templateNavController(unselectedImage: UIImage(named: "today"), selectedImage: UIImage(named: "today"), rootViewController: TodayWeatherViewController())
        
        todayWeatherController.title = "Today"
        
        
        let forecastWeatherController = templateNavController(unselectedImage: UIImage(named: "forecast"), selectedImage: UIImage(named: "forecast"), rootViewController: ForecarWeatherCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout()))
        
        forecastWeatherController.title = "Forecast"
        
        viewControllers = [todayWeatherController, forecastWeatherController]
    }

    private func templateNavController(unselectedImage: UIImage?, selectedImage: UIImage?, rootViewController: UIViewController = UIViewController()) -> UINavigationController {

            let viewController = rootViewController
            let navController = UINavigationController(rootViewController: viewController)
            navController.tabBarItem.image = unselectedImage
            navController.tabBarItem.selectedImage = selectedImage
            return navController
}
    
}
