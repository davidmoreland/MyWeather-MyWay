//
//  WeatherService.swift
//  My Weather My Way
//
//  Created by David Moreland on 3/1/21.
//

import Foundation

class WeatherService {
    
    func getWeather(city: String, completion: @escaping (BasicWeather?) ->()) {
    
        guard let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=5d0ddacf3fc0eaa1cff53c14d2dd1886&units=imperial")  else {
            completion(nil)
            return
        }
        URLSession.shared.dataTask(with: url) {data, response, error in
                                   
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            let weatherResponse = try? JSONDecoder().decode(WeatherData.self, from: data)
            if let weatherResponse = weatherResponse {
                let weather = weatherResponse.main
                completion(weather)
            } else {
                completion(nil)
            }
        }.resume()
    }
}


