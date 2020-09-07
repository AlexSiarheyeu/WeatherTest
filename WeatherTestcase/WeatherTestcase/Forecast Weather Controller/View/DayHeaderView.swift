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
        let label = UILabel().createLabelWith(title: "  Today", font: .system(18))
        label.layer.borderWidth = 1
        label.textAlignment = .left
        label.layer.borderColor = UIColor.gray.withAlphaComponent(0.3).cgColor
        return label
    }()
    
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
