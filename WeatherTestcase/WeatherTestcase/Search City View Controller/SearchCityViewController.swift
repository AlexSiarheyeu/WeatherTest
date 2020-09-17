//
//  SearchCityViewController.swift
//  WeatherTestcase
//
//  Created by Alexey Sergeev on 9/13/20.
//  Copyright © 2020 Alexey Sergeev. All rights reserved.
//

import UIKit
import CoreLocation

class SearchCityViewController: UIViewController {
    
    let searchCityTextField: UITextField = {
        let searchTF = UITextField()
        searchTF.translatesAutoresizingMaskIntoConstraints = false
        searchTF.placeholder = "Search"
        searchTF.layer.cornerRadius = 5
        searchTF.textColor = .black
        searchTF.font = .boldSystemFont(ofSize: 16)
        searchTF.layer.borderWidth = 1
        searchTF.setLeftPaddingPoints(8)
        return searchTF
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSearchTextField()
    }
    
    private func setupSearchTextField() {
        
        view.backgroundColor = .white
        view.addSubview(searchCityTextField)
        searchCityTextField.becomeFirstResponder()
        searchCityTextField.addTarget(self, action: #selector(textDidChange), for: .editingDidEndOnExit)
        
        NSLayoutConstraint.activate([
            searchCityTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            searchCityTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            searchCityTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            searchCityTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
        @objc private func textDidChange () {
              
            guard let text = searchCityTextField.text else {return}
            
            getCoordinateFrom(address: text) { (coordinate, error) in
                guard let coordinate = coordinate, error == nil else {return}
                
                NetworkService.shared.getWeather(lat: coordinate.latitude, lon: coordinate.longitude) { (result) in
                    switch result {
                        
                    case .success(let weather):
                        WeatherSaver.weather = weather
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }
            navigationController?.popViewController(animated: true)
          
    }
    
    private func getCoordinateFrom(address: String, completion: @escaping(_ coordinate: CLLocationCoordinate2D?, _ error: Error?) -> () ) {
        CLGeocoder().geocodeAddressString(address) { completion($0?.first?.location?.coordinate, $1) }
    }
}
