//
//  ForecastController + DataSource.swift
//  WeatherTestcase
//
//  Created by Alexey Sergeev on 9/6/20.
//  Copyright © 2020 Alexey Sergeev. All rights reserved.
//

import UIKit

extension ForecarWeatherCollectionViewController {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        guard let vm = forecastViewModel else {return 2}
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return 2
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ForecastCollectionViewCell
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath)
         return header
     }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 30)
    }
}
    
extension ForecarWeatherCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
                return CGSize(width: view.frame.width, height: 70)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 30, left: 0, bottom: 0, right: 0)
    }
}

