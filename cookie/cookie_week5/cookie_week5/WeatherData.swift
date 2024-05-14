//
//  WeatherManager.swift
//  cookie_week5
//
//  Created by 김경서 on 5/14/24.
//

import Foundation

struct WeatherData: Decodable {
    let main: Main
    let weather: [Weather]
    
    struct Main: Decodable {
        let temp, feelsLike, tempMin, tempMax: Double
        let pressure, humidity: Int
        
        enum CodingKeys: String, CodingKey {
            case temp
            case feelsLike = "feels_like"
            case tempMin = "temp_min"
            case tempMax = "temp_max"
            case pressure, humidity
        }
    }
    
    struct Weather: Decodable {
        let id: Int
        let main, weatherDescription, icon: String
        
        enum CodingKeys: String, CodingKey {
            case id, main
            case weatherDescription = "description"
            case icon
        }
    }
}
