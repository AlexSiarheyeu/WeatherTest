//
//  DayView.swift
//  WeatherTestcase
//
//  Created by Alexey Sergeev on 9/5/20.
//  Copyright © 2020 Alexey Sergeev. All rights reserved.
//

import UIKit

class DayHeaderView: UICollectionReusableView {
    
    let dayLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.layer.borderWidth = 1
        label.textAlignment = .left
        label.layer.borderColor = UIColor.gray.withAlphaComponent(0.3).cgColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var viewModel: ForecastWeatherCellViewModelType? {
        didSet {
            dayLabel.text = viewModel?.getCurrentDay()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
                
        addSubview(dayLabel)
        NSLayoutConstraint.activate([
            dayLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            dayLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            dayLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
