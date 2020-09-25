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
    
    let weatherConditionImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "sun")
        return imageView
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let weatherConditionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
  
    let temperatureLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        label.font = .boldSystemFont(ofSize: 32)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
     weak var viewModel: ForecastWeatherCellViewModelType? {
        didSet {
            weatherConditionImage.image = viewModel?.getWeatherConditionImage()
            timeLabel.text = viewModel?.getCurrentDate()
            weatherConditionLabel.text = viewModel?.getWeatherCondition()
            temperatureLabel.text = viewModel?.getTemperature()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let views = [weatherConditionLabel, weatherConditionImage, timeLabel, temperatureLabel, separatorView]
        views.forEach { addSubview($0) }
        activatingConstraintsForInputViews()
    }
    
    private func activatingConstraintsForInputViews() {
        
        NSLayoutConstraint.activate([
            weatherConditionImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            weatherConditionImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            weatherConditionImage.heightAnchor.constraint(equalToConstant: 50),
            weatherConditionImage.widthAnchor.constraint(equalToConstant: 50),

            timeLabel.leadingAnchor.constraint(equalTo: weatherConditionImage.trailingAnchor, constant: 15),
            timeLabel.topAnchor.constraint(equalTo: weatherConditionImage.topAnchor),
            
            weatherConditionLabel.leadingAnchor.constraint(equalTo: timeLabel.leadingAnchor),
            weatherConditionLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor),
            
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
