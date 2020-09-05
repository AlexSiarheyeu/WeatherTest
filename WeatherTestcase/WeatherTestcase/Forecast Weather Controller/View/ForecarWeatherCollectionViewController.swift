//
//  ForecarWeatherCollectionViewController.swift
//  WeatherTestcase
//
//  Created by Alexey Sergeev on 9/5/20.
//  Copyright © 2020 Alexey Sergeev. All rights reserved.
//

import UIKit

private let cellId = "cell"
private let headerId = "header"

class ForecarWeatherCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        self.collectionView.register(ForecastCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        self.collectionView.register(DayHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath)
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 20)
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 2
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 2
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ForecastCollectionViewCell
            return cell
    }
    
}

extension ForecarWeatherCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
                return CGSize(width: view.frame.width, height: 50)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 0, bottom: 20, right: 0)
    }
    
    
}
