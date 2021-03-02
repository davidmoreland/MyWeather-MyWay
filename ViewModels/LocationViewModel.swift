//
//  LocationViewModel.swift
//  MyWeatherMyWay
//
//  Created by David Moreland on 3/1/21.
//

import Foundation

class LocationViewModel: ObservableObject {
    private var locationService: LocationService!
    private var cityName = $weatherVM.cityName
    init() {
        var locationService = LocationService()
    }
    
    private func fetchLocation(by city: String) {
        self..getWeather(city: city) { weather in
            if let weather = weather {
                DispatchQueue.main.async {
                    self.weather = weather
                }
        
            }
        
        }
    }
}
