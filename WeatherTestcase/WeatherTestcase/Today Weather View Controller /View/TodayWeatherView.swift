//
//  TodayWeatherView.swift
//  WeatherTestcase
//
//  Created by Alexey Sergeev on 9/4/20.
//  Copyright © 2020 Alexey Sergeev. All rights reserved.
//

import UIKit

class TodayWeatherView: UIView {
    
    let underNavBarColoringImageView: UIImageView = {
        let imageView = UIImageView().createImageViewWith(imageNamed: "rainbow")
        return imageView
    }()
    
    let weatherStateImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let cityAndCountryLabel: UILabel = {
        let label = UILabel().createLabelWith(font: .system(20))
        return label
    }()
    
    let temperatureAndWeatherStateLabel: UILabel = {
        let label = UILabel().createLabelWith(font: .system(24),
                                              textColor: .systemBlue)
        return label
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        return view
    }()
    
    let bottomSeparatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        return view
    }()
    
    let humidityImageView: UIImageView = {
        let imageView = UIImageView().createImageViewWith(imageNamed: "humidity")
        return imageView
    }()
    
    let humidityLabel: UILabel = {
        let label = UILabel().createLabelWith(font: .system(16))
        return label
    }()
    
    let precipitationImageView: UIImageView = {
        let imageView = UIImageView().createImageViewWith(imageNamed: "precipitation")
        return imageView
    }()
    
    let precipitationLabel: UILabel = {
        let label = UILabel().createLabelWith(font: .system(16))
        return label
    }()
    
    let pressureImageView: UIImageView = {
        let imageView = UIImageView().createImageViewWith(imageNamed: "celsius")
        return imageView
    }()
    
    let pressureLabel: UILabel = {
        let label = UILabel().createLabelWith(font: .system(16))
        return label
    }()
    
    let windSpeedImageView: UIImageView = {
        let imageView = UIImageView().createImageViewWith(imageNamed: "windSpeed")
        return imageView
    }()
    
    let windSpeedLabel: UILabel = {
        let label = UILabel().createLabelWith(font: .system(16))
        return label
    }()
    
    let compassImageView: UIImageView = {
        let imageView = UIImageView().createImageViewWith(imageNamed: "compass")
        return imageView
    }()
    
    let compassLabel: UILabel = {
        let label = UILabel().createLabelWith(font: .system(16))
        return label
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
    
        var view = [UIView]()
        view = [underNavBarColoringImageView, weatherStateImageView, cityAndCountryLabel, temperatureAndWeatherStateLabel, separatorView, humidityImageView, humidityLabel, precipitationImageView, precipitationLabel, pressureImageView, pressureLabel, windSpeedImageView, windSpeedLabel, compassImageView, compassLabel, bottomSeparatorView]
        
        for view in view {
            addSubview(view)
        }
        
        humidityImageView.addDashedBorder()
        precipitationImageView.addDashedBorder()
        pressureImageView.addDashedBorder()
        windSpeedImageView.addDashedBorder()
        compassImageView.addDashedBorder()
        
        underNavBarColoringImageView.makeDashedBorderLine()
        
        
        NSLayoutConstraint.activate([
            
            underNavBarColoringImageView.widthAnchor.constraint(equalTo: widthAnchor),
            underNavBarColoringImageView.heightAnchor.constraint(equalToConstant: 2),
            underNavBarColoringImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            
            weatherStateImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            weatherStateImageView.widthAnchor.constraint(equalToConstant: 120),
            weatherStateImageView.heightAnchor.constraint(equalToConstant: 120),
            weatherStateImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            
            cityAndCountryLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            cityAndCountryLabel.heightAnchor.constraint(equalToConstant: 25),
            cityAndCountryLabel.topAnchor.constraint(equalTo: weatherStateImageView.bottomAnchor, constant: 10),
            
            temperatureAndWeatherStateLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            temperatureAndWeatherStateLabel.heightAnchor.constraint(equalToConstant: 25),
            temperatureAndWeatherStateLabel.topAnchor.constraint(equalTo: cityAndCountryLabel.bottomAnchor, constant: 25),

            separatorView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/3),
            separatorView.heightAnchor.constraint(equalToConstant: 0.5),
            separatorView.topAnchor.constraint(equalTo: temperatureAndWeatherStateLabel.bottomAnchor, constant: 55),
            separatorView.centerXAnchor.constraint(equalTo: centerXAnchor),

            humidityImageView.widthAnchor.constraint(equalToConstant: 40),
            humidityImageView.heightAnchor.constraint(equalToConstant: 40),
            humidityImageView.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: 35),
            humidityImageView.trailingAnchor.constraint(equalTo: precipitationImageView.leadingAnchor, constant: -85),
            
            humidityLabel.topAnchor.constraint(equalTo: humidityImageView.bottomAnchor, constant: 10),
            humidityLabel.centerXAnchor.constraint(equalTo: humidityImageView.centerXAnchor),
            
            precipitationImageView.widthAnchor.constraint(equalToConstant: 40),
            precipitationImageView.heightAnchor.constraint(equalToConstant: 40),
            precipitationImageView.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: 35),
            precipitationImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            precipitationLabel.topAnchor.constraint(equalTo: precipitationImageView.bottomAnchor, constant: 10),
            precipitationLabel.centerXAnchor.constraint(equalTo: precipitationImageView.centerXAnchor),
            
            pressureImageView.widthAnchor.constraint(equalToConstant: 40),
            pressureImageView.heightAnchor.constraint(equalToConstant: 40),
            pressureImageView.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: 35),
            pressureImageView.leadingAnchor.constraint(equalTo: precipitationImageView.trailingAnchor, constant: 85),
            
            pressureLabel.topAnchor.constraint(equalTo: pressureImageView.bottomAnchor, constant: 10),
            pressureLabel.centerXAnchor.constraint(equalTo: pressureImageView.centerXAnchor),
            
            windSpeedImageView.widthAnchor.constraint(equalToConstant: 40),
            windSpeedImageView.heightAnchor.constraint(equalToConstant: 40),
            windSpeedImageView.topAnchor.constraint(equalTo: precipitationImageView.bottomAnchor, constant: 65),
            windSpeedImageView.leadingAnchor.constraint(equalTo: humidityImageView.trailingAnchor, constant: 25),
            
            windSpeedLabel.topAnchor.constraint(equalTo: windSpeedImageView.bottomAnchor, constant: 10),
            windSpeedLabel.centerXAnchor.constraint(equalTo: windSpeedImageView.centerXAnchor),
            
            compassImageView.widthAnchor.constraint(equalToConstant: 40),
            compassImageView.heightAnchor.constraint(equalToConstant: 40),
            compassImageView.topAnchor.constraint(equalTo: precipitationImageView.bottomAnchor, constant: 65),
            compassImageView.trailingAnchor.constraint(equalTo: pressureImageView.leadingAnchor, constant: -25),
            
            compassLabel.topAnchor.constraint(equalTo: compassImageView.bottomAnchor, constant: 10),
            compassLabel.centerXAnchor.constraint(equalTo: compassImageView.centerXAnchor),
            
            bottomSeparatorView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/3),
            bottomSeparatorView.heightAnchor.constraint(equalToConstant: 0.5),
            bottomSeparatorView.topAnchor.constraint(equalTo: compassLabel.bottomAnchor, constant: 35),
            bottomSeparatorView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
        ])
    }
    
   
}


