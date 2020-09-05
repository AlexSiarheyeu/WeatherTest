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
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "rainbow")
        return imageView
    }()
    
    let weatherStateImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "sun")
        return imageView
    }()
    
    let cityAndCountryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    let temperatureAndStateWeatherLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24)
        label.textAlignment = .center
        label.textColor = .systemBlue
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
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "humidity")
        return imageView
    }()
    
    let humidityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        return label
    }()
    
    let precipitationImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "precipitation")
        return imageView
    }()
    
    let precipitationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        return label
    }()
    
    let pressureImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "celsius")
        return imageView
    }()
    
    let pressureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        return label
    }()
    
    let windSpeedImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "windSpeed")
        return imageView
    }()
    
    let windSpeedLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        return label
    }()
    
    let compassImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "compass")
        return imageView
    }()
    
    let compassLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "SE"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        return label
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        
        addSubview(underNavBarColoringImageView)
        
        addSubview(weatherStateImageView)
        addSubview(cityAndCountryLabel)
        addSubview(temperatureAndStateWeatherLabel)
        addSubview(separatorView)
        
        addSubview(humidityImageView)
        addSubview(humidityLabel)
        addSubview(precipitationImageView)
        addSubview(precipitationLabel)
        addSubview(pressureImageView)
        addSubview(pressureLabel)
        addSubview(windSpeedImageView)
        addSubview(windSpeedLabel)
        addSubview(compassImageView)
        addSubview(compassLabel)
        addSubview(bottomSeparatorView)
        
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
            weatherStateImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 80),
            
            cityAndCountryLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            cityAndCountryLabel.heightAnchor.constraint(equalToConstant: 25),
            cityAndCountryLabel.topAnchor.constraint(equalTo: weatherStateImageView.bottomAnchor, constant: 25),
            
            temperatureAndStateWeatherLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            temperatureAndStateWeatherLabel.heightAnchor.constraint(equalToConstant: 25),
            temperatureAndStateWeatherLabel.topAnchor.constraint(equalTo: cityAndCountryLabel.bottomAnchor, constant: 25),

            separatorView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/3),
            separatorView.heightAnchor.constraint(equalToConstant: 0.5),
            separatorView.topAnchor.constraint(equalTo: temperatureAndStateWeatherLabel.bottomAnchor, constant: 55),
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
            bottomSeparatorView.topAnchor.constraint(equalTo: compassLabel.bottomAnchor, constant: 55),
            bottomSeparatorView.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
}

extension UIView {
    
     private static let lineDashPattern: [NSNumber] = [2, 2]
     private static let lineDashWidth: CGFloat = 1.0

     func makeDashedBorderLine() {
        
           let path = CGMutablePath()
           let shapeLayer = CAShapeLayer()
           shapeLayer.lineWidth = UIView.lineDashWidth
           shapeLayer.strokeColor = UIColor.lightGray.cgColor
           shapeLayer.lineDashPattern = UIView.lineDashPattern
           path.addLines(between: [CGPoint(x: bounds.minX, y: bounds.height/2),
                                   CGPoint(x: bounds.maxX, y: bounds.height/2)])
           shapeLayer.path = path
           layer.addSublayer(shapeLayer)
    }
    
    func addDashedBorder() {
        let color = UIColor.red.cgColor

        let shapeLayer:CAShapeLayer = CAShapeLayer()
        let frameSize = self.frame.size
        let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width+5, height: frameSize.height+5)

        shapeLayer.bounds = shapeRect
        shapeLayer.position = CGPoint(x: frameSize.width/2, y: frameSize.height/2)
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = color
        shapeLayer.lineWidth = 0.5
        shapeLayer.lineJoin = CAShapeLayerLineJoin.round
        shapeLayer.lineDashPattern = [2,2]
        shapeLayer.path = UIBezierPath(roundedRect: shapeRect, cornerRadius: 5).cgPath

        self.layer.addSublayer(shapeLayer)
    }
}
