//
//  WeatherViewModel.swift
//  My Weather My Way
//
//  Created by David Moreland on 3/1/21.
//

import Foundation

class WeatherViewModel: ObservableObject {
    private var weatherService: WeatherService!
    
    
    @Published var weather = BasicWeather()
    @Published var cityName: String = ""
    
    init() {
        self.weatherService = WeatherService()
    }
    
    
        var temperature: String {
            if let temp = self.weather.temp {
                return String(format: "%.0f",temp)
            } else {
                return ""
            }
        }
        
        var humidity: String {
            if let humidity = self.weather.humidity {
                return String(format: "%.0f",humidity)
            } else {
                return ""
            }
        }
       
    
    func search() {
        if let city = self.cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            fetchWeather(by: city)
        }
    }
    
    private func fetchWeather(by city: String) {
        self.weatherService.getWeather(city: city) { weather in
            if let weather = weather {
                DispatchQueue.main.async {
                    self.weather = weather
                }
        
            }
        
        }
    }
}
