//
//  NetworkService.swift
//  WeatherTestcase
//
//  Created by Alexey Sergeev on 9/3/20.
//  Copyright © 2020 Alexey Sergeev. All rights reserved.
//

import Foundation
import CoreLocation

class API {
    static let apiKey = "57fdd698fcaed1770a436586c9c81811"
    static let basicURL = "https://api.openweathermap.org/data/2.5"
}

enum DataManagerError: Error {
    case failedRequest
    case invalidResponse
    case unknown
}

class NetworkService {
    
    static let shared = NetworkService()
    
    func getURL(latitude: Double, longitude: Double) -> String {
        
        let oneCallAPI = "/onecall?lat=\(latitude)" + "&lon=\(longitude)" + "&exclude=minutely" + "&appid=" + API.apiKey
        return API.basicURL + oneCallAPI
    }

    func getWeather(lat: Double, lon: Double, completion: @escaping (Result<ResultWeather, DataManagerError>) -> ()) {
        
        guard let url = URL(string: getURL(latitude: lat, longitude: lon)) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let _ = error {
                completion(.failure(.failedRequest))
                return
            }
            
            guard let data = data else { return }
            
            do {
                let weatherObject = try JSONDecoder().decode(ResultWeather.self, from: data)
                completion(.success(weatherObject))
                
            } catch {
                completion(.failure(.invalidResponse))
            }
            completion(.failure(.unknown))
            
        }.resume()
    }
}
