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
        return forecastViewModel?.sectionsOfDays.count ?? 0
        
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return forecastViewModel?.sectionsOfDays[section].count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ForecastWeatherCollectionViewController.cellId, for: indexPath) as! ForecastCollectionViewCell
        
        cell.timeLabel.text =
            forecastViewModel?.getTime(indexPath.section, indexPath.row)
        cell.temperatureLabel.text =
            forecastViewModel?.temperature(indexPath.section, indexPath.row)
        cell.weatherStateLabel.text =
            forecastViewModel?.weatherState(indexPath.section, indexPath.row)
        cell.weatherStateImageView.image =
            forecastViewModel?.getWeatherStateImage(indexPath.section, indexPath.row)
       
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ForecastWeatherCollectionViewController.headerId, for: indexPath) as! DayHeaderView
        header.dayLabel.text = forecastViewModel?.week(for: indexPath.section)
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

