//
//  ForecarWeatherCollectionViewController.swift
//  WeatherTestcase
//
//  Created by Alexey Sergeev on 9/5/20.
//  Copyright © 2020 Alexey Sergeev. All rights reserved.
//

import UIKit
import CoreLocation

extension ForecastWeatherCollectionViewController {
    static let cellId = "cell"
    static let headerId = "header"
}

class ForecastWeatherCollectionViewController: UICollectionViewController {

    let underNavBarColoringImageView: UIImageView = {
        let imageView = UIImageView() 
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "rainbow")
        return imageView
    }()
    
    var forecastViewModel = ForecastWeatherViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUnderNavBarColoringLine()

        collectionView.backgroundColor = .white
        collectionView.register(ForecastCollectionViewCell.self, forCellWithReuseIdentifier: ForecastWeatherCollectionViewController.cellId)
        collectionView.register(DayHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ForecastWeatherCollectionViewController.headerId)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }
    
    func setupUnderNavBarColoringLine() {
        view.addSubview(underNavBarColoringImageView)
        NSLayoutConstraint.activate([
            underNavBarColoringImageView.widthAnchor.constraint(equalTo: view.widthAnchor),
            underNavBarColoringImageView.heightAnchor.constraint(equalToConstant: 2),
            underNavBarColoringImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
    }
}
