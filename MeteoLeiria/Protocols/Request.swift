//
//  Request.swift
//  MeteoLeiria
//
//  Created by Tiago Dias on 12/06/2017.
//  Copyright © 2017 Tiago Dias. All rights reserved.
//

import Foundation

enum JSONRequestResult {
    case success(data: Weather)
    case failure(error: Error)
}

protocol WeatherRequest {
    func getWeatherData(completionHandler: @escaping (JSONRequestResult) -> Void)
}

