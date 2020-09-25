//
//  ForecastController + DataSource.swift
//  WeatherTestcase
//
//  Created by Alexey Sergeev on 9/6/20.
//  Copyright © 2020 Alexey Sergeev. All rights reserved.
//

import UIKit

extension ForecastWeatherCollectionViewController {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return forecastViewModel?.numberOfSections ?? 0
        
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return forecastViewModel?.numberOfItems(section) ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Idenifiers.cellId.rawValue, for: indexPath) as! ForecastCollectionViewCell
        guard let viewModel = forecastViewModel else {return UICollectionViewCell()}
        let cellViewModel = viewModel.configureCell(indexPath.section, indexPath.row)
        cell.viewModel = cellViewModel
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Idenifiers.headerId.rawValue, for: indexPath) as! DayHeaderView
        guard let viewModel = forecastViewModel else {return UICollectionViewCell()}

        let cellViewModel = viewModel.configureCell(indexPath.section, indexPath.row)
        header.viewModel = cellViewModel
        
        return header
     }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 30)
    }
}
    
extension ForecastWeatherCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
                return CGSize(width: view.frame.width, height: 70)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 30, left: 0, bottom: 0, right: 0)
    }
}

