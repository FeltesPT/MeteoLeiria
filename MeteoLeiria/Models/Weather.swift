
//  Weather.swift
//  MeteoLeiria
//
//  Created by Tiago Dias on 11/06/2017.
//  Copyright © 2017 Tiago Dias. All rights reserved.
//

import Foundation

struct Weather: Codable {
    var current: Current
    var forecast: [Forecast]
}
struct Current: CurrentType, Codable {
    var tempCelsius: Double
    var humidityPercentage: Int
    var windSpeedAvgKmH: Double
}

struct Forecast: ForecastType, Codable {
    var day: String
    var icon: String
    var tempHighCelsius: Int
    var tempLowCelsius: Int
    var rainProbabilityPercentage: Int
    var conditions: String
}
