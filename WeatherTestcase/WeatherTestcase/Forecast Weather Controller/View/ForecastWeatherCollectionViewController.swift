//
//  ForecarWeatherCollectionViewController.swift
//  WeatherTestcase
//
//  Created by Alexey Sergeev on 9/5/20.
//  Copyright © 2020 Alexey Sergeev. All rights reserved.
//

import UIKit
import CoreLocation

enum Idenifiers: String {
    case cellId
    case headerId
}

class ForecastWeatherCollectionViewController: UICollectionViewController {

    let underNavBarColoringImageView: UIImageView = {
        let imageView = UIImageView() 
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "rainbow")
        return imageView
    }()
    
    var forecastViewModel: ForecastWeatherViewModelType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUnderNavBarColoringLine()
        collectionView.backgroundColor = .white
        collectionView.register(ForecastCollectionViewCell.self, forCellWithReuseIdentifier: Idenifiers.cellId.rawValue)
        collectionView.register(DayHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Idenifiers.headerId.rawValue)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        forecastViewModel = ForecastWeatherViewModel()
        collectionView.reloadData()
    }
    
    private func setupUnderNavBarColoringLine() {
        
        view.addSubview(underNavBarColoringImageView)
        underNavBarColoringImageView.makeDashedBorderLine()
        NSLayoutConstraint.activate([
            underNavBarColoringImageView.widthAnchor.constraint(equalTo: view.widthAnchor),
            underNavBarColoringImageView.heightAnchor.constraint(equalToConstant: 2),
            underNavBarColoringImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
    }
}
