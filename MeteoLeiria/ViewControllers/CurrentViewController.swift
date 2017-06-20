//
//  CurrentViewController.swift
//  MeteoLeiria
//
//  Created by Tiago Dias on 20/06/2017.
//  Copyright © 2017 Tiago Dias. All rights reserved.
//

import UIKit

final class CurrentViewController: UIViewController {
    
    @IBOutlet weak var wind: UILabel!
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var rain: UILabel!
    
    public var weather: Weather?

    public func refresh() {
        if let windSpeed = weather?.current.windSpeedAvgKmH {
            wind.text = "\(windSpeed)Km/H"
        }
        
        if let humidityProb = weather?.current.humidityPercentage {
            humidity.text = "\(humidityProb)%"
        }
        
        if let rainProb = weather?.forecast.first?.rainProbabilityPercentage {
            rain.text = "\(rainProb)%"
        }
    }

}
