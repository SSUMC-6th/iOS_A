//
//  weather.swift
//  baki_week5
//
//  Created by 박희민 on 5/12/24.
//

import Foundation

struct WeatherResponse: Decodable {
    let main: Main
    let wind: Wind
    let weather: [Weather]
}

struct Main: Decodable {
    let temp: Double
    let feels_like: Double
    let humidity: Int
}

struct Wind: Decodable {
    let speed: Double
}

struct Weather: Decodable {
    let main: String
    let description: String
    let icon: String
}
