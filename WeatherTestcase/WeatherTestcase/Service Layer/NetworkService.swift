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
    
    private func getURL(latitude: Double, longitude: Double) -> String {
        
        let oneCallAPI = "/onecall?lat=\(latitude)" + "&lon=\(longitude)" + "&exclude=minutely" + "&appid=" + API.apiKey
        return API.basicURL + oneCallAPI
    }
    
    func getWeatherAt(latitude: Double, longitude: Double, completion: @escaping (Result<ResultWeather, DataManagerError>) -> ()) {

        self.locationURLRequestWith(latitude: latitude, longitude: longitude) { (data, error) in
          
           if let _ = error {
               completion(.failure(.failedRequest))
               return
           }
            
            guard let decodeObject = self.genericJSONDecoder(type: ResultWeather.self, data: data) else {return}
            completion(.success(decodeObject))
        }
    }
    
    private func genericJSONDecoder<T: Decodable>(type: T.Type, data: Data?) -> T? {
        
        let decoder = JSONDecoder()
        
        guard let data = data else  {return nil}
        do {
            let object = try decoder.decode(type.self, from: data)
            return object
        } catch let error {
            print("Failed to  decode JSON", error.localizedDescription)
            return nil
        }
    }
    
     private func locationURLRequestWith(latitude: Double, longitude: Double, completion: @escaping (Data?, Error?) -> ()) {
        
        guard let url = URL(string: getURL(latitude: latitude, longitude: longitude)) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            completion(data, error)
          
        }.resume()
    }

}

