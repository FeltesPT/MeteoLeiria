//
//  CurrentViewController.swift
//  MeteoLeiria
//
//  Created by Tiago Dias on 20/06/2017.
//  Copyright © 2017 Tiago Dias. All rights reserved.
//

import UIKit

final class CurrentViewController: UIViewController {
    
    @IBOutlet weak var icon: UIImageView!
    
    @IBOutlet weak var currentTemp: UILabel!
    @IBOutlet weak var highMinTemp: UILabel!
    @IBOutlet weak var windTitle: UILabel!
    @IBOutlet weak var humidityTitle: UILabel!
    @IBOutlet weak var rainTitle: UILabel!
    @IBOutlet weak var wind: UILabel!
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var rain: UILabel!
    
    public var weather: Weather?
    public var selectedIndex: Int = 0
    
    public func refresh() {
        
        animateLabel(forecast: selectedIndex != 0)
        
        commonInit()
        
        if let first = weather?.forecast[selectedIndex],
            let image = UIImage(named: "\(first.icon)_w") {
            icon.image = image
        }
        
        if let min = weather?.forecast[selectedIndex].tempLowCelsius,
            let max = weather?.forecast.first?.tempHighCelsius {
            highMinTemp.text = "\(min)º / \(max)º"
        }
        if let rainProb = weather?.forecast[selectedIndex].rainProbabilityPercentage {
            rain.text = "\(rainProb)%"
        }
        
        if selectedIndex == 0 {
            
            if let current = weather?.current.tempCelsius {
                currentTemp.text = "\(Int(current))º"
            }
            if let windSpeed = weather?.current.windSpeedAvgKmH {
                wind.text = "\(windSpeed)Km/H"
            }
            if let humidityProb = weather?.current.humidityPercentage {
                humidity.text = "\(humidityProb)%"
            }
        }
        
    }
    
    private func commonInit() {
        currentTemp.textColor = UIColor.white
        highMinTemp.textColor = UIColor.white
        windTitle.textColor = UIColor.borderWhite
        humidityTitle.textColor = UIColor.borderWhite
        rainTitle.textColor = UIColor.borderWhite
        wind.textColor = UIColor.white
        humidity.textColor = UIColor.white
        rain.textColor = UIColor.white
    }
    
    private func animateLabel(forecast: Bool) {
        if forecast {
            
            UIView.animate(withDuration: 0.5, animations: {
                
                self.currentTemp.alpha = 0
                
            }, completion: { (success) in
                
                UIView.animate(withDuration: 0.5) {
                    self.highMinTemp.animateToFont(UIFont.systemFont(ofSize: 70), withDuration: 0.5)
                }
                
            })
            
        } else {
            
            UIView.animate(withDuration: 0.5, animations: {
                
                self.highMinTemp.animateToFont(UIFont.systemFont(ofSize: 17), withDuration: 0.5)
                
            }, completion: { (success) in
                
                UIView.animate(withDuration: 0.5) {
                    self.currentTemp.alpha = 1
                    
                }
                
            })
        }
    }
}

