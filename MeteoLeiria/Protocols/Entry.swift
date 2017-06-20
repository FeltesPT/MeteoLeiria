//
//  Entry.swift
//  MeteoLeiria
//
//  Created by Tiago Dias on 11/06/2017.
//  Copyright © 2017 Tiago Dias. All rights reserved.
//

import Foundation

protocol CurrentType {
    var tempCelsius: Double { get set }
    var humidityPercentage: Int { get set }
    var windSpeedAvgKmH: Double { get set }
}

protocol ForecastType {
    var day: String { get set }
    var icon: String { get set }
    var tempHighCelsius: Int { get set }
    var tempLowCelsius: Int { get set }
    var rainProbabilityPercentage: Int { get set }
    var conditions: String { get set }
}
