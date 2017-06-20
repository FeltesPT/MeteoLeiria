//
//  WeatherManager.swift
//  MeteoLeiria
//
//  Created by Tiago Dias on 13/06/2017.
//  Copyright © 2017 Tiago Dias. All rights reserved.
//

import Foundation

enum ForecastResult {
    case success(weather: Weather)
    case failure(error: Error)
}

protocol WeatherManager {
    func getWeatherData(completionHandler: @escaping (ForecastResult) -> Void)
}
