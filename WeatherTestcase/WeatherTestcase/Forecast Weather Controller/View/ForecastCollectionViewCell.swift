//
//  File.swift
//  WeatherTestcase
//
//  Created by Alexey Sergeev on 9/5/20.
//  Copyright © 2020 Alexey Sergeev. All rights reserved.
//

import UIKit

class ForecastCollectionViewCell: UICollectionViewCell {
    
    let separatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.gray.withAlphaComponent(0.2)
        return view
    }()
    
    let weatherStateImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "sun")
        return imageView
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel().createLabelWith(title: "13:00",
                                              font: .system(20))
        return label
    }()
    
    let weatherStateLabel: UILabel = {
        let label = UILabel().createLabelWith(title: "Clear",
                                              font: .system(18))
        return label
    }()
  
    let temperatureLabel: UILabel = {
        let label = UILabel().createLabelWith(title: "22 C",
                                              font: .bold(32),
                                              textColor: .systemBlue)
        return label
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(weatherStateLabel)
        addSubview(weatherStateImageView)
        addSubview(timeLabel)
        addSubview(temperatureLabel)
        addSubview(separatorView)
        
        NSLayoutConstraint.activate([
            weatherStateImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            weatherStateImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            weatherStateImageView.heightAnchor.constraint(equalToConstant: 50),
            weatherStateImageView.widthAnchor.constraint(equalToConstant: 50),

            timeLabel.leadingAnchor.constraint(equalTo: weatherStateImageView.trailingAnchor, constant: 15),
            timeLabel.topAnchor.constraint(equalTo: weatherStateImageView.topAnchor),
            
            weatherStateLabel.leadingAnchor.constraint(equalTo: timeLabel.leadingAnchor),
            weatherStateLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor),
            
            temperatureLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            temperatureLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            separatorView.leadingAnchor.constraint(equalTo: timeLabel.leadingAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 1),
            separatorView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            separatorView.bottomAnchor.constraint(equalTo: bottomAnchor)
        
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
