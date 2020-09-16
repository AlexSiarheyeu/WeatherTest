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
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let weatherStateLabel: UILabel = {
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let views = [weatherStateLabel, weatherStateImageView, timeLabel, temperatureLabel, separatorView]
        
        views.forEach { addSubview($0) }
        
        activatingConstraintsForInputViews()
        
    }
    
    func configure(viewModel: ForecastWeatherViewModel, _ section: Int, _ row: Int) {
        
        timeLabel.text = viewModel.getTime(section, row)
        temperatureLabel.text = viewModel.temperature(section, row)
        weatherStateLabel.text = viewModel.weatherState(section, row)
        weatherStateImageView.image = viewModel.getWeatherStateImage(section, row)
    }
    
    private func activatingConstraintsForInputViews() {
        
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
