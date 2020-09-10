//
//  ForecarWeatherCollectionViewController.swift
//  WeatherTestcase
//
//  Created by Alexey Sergeev on 9/5/20.
//  Copyright © 2020 Alexey Sergeev. All rights reserved.
//

import UIKit
import CoreLocation

let cellId = "cell"
let headerId = "header"

class ForecarWeatherCollectionViewController: UICollectionViewController {

    let underNavBarColoringImageView: UIImageView = {
        let imageView = UIImageView().createImageViewWith(imageNamed: "rainbow")
        return imageView
    }()
    
    var forecastViewModel: ForecastWeatherViewModel? {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(underNavBarColoringImageView)

        NSLayoutConstraint.activate([
            underNavBarColoringImageView.widthAnchor.constraint(equalTo: view.widthAnchor),
            underNavBarColoringImageView.heightAnchor.constraint(equalToConstant: 2),
            underNavBarColoringImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])

        collectionView.backgroundColor = .white
        self.collectionView.register(ForecastCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        
        self.collectionView.register(DayHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
    }
}
