//
//  Weather.swift
//  My Weather My Way
//
//  Created by David Moreland on 3/1/21.
//

import Foundation

struct WeatherData: Decodable {
    let main: BasicWeather
}

struct BasicWeather: Decodable {
    
    var temp: Double?
    var humidity: Double?
}
