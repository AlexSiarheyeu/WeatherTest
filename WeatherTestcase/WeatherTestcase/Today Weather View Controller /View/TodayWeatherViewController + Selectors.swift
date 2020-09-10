//
//  TodayWeatherViewController + Selectors.swift
//  WeatherTestcase
//
//  Created by Alexey Sergeev on 9/10/20.
//  Copyright © 2020 Alexey Sergeev. All rights reserved.
//

import UIKit

extension TodayWeatherViewController {
    
    @objc func handleShareButton() {
        
        guard let text = self.weatherResultViewModel?.temperatureAndWeatherState else {return}
           
        let activityViewController = UIActivityViewController(activityItems: [text], applicationActivities: nil)
        
        activityViewController.popoverPresentationController?.sourceView = self.view

        self.present(activityViewController, animated: true, completion: nil)
    }
}
