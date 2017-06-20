//
//  ServiceManager.swift
//  MeteoLeiria
//
//  Created by Tiago Dias on 12/06/2017.
//  Copyright © 2017 Tiago Dias. All rights reserved.
//

import Foundation

final class ServiceManager: NSObject {
    private let service: WeatherRequest!
    
    init(service: WeatherRequest = MeteoLeiriaService()) {
        self.service = service
        super.init()
    }
}

extension ServiceManager: WeatherManager {
    func getWeatherData(completionHandler: @escaping (ForecastResult) -> Void) {
        service.getWeatherData { (result) in
            switch result {
            case let .failure(error: error):
                completionHandler(ForecastResult.failure(error: error))
            case let .success(data: json):
                completionHandler(ForecastResult.success(weather: json))
            }
        }
    }
}
