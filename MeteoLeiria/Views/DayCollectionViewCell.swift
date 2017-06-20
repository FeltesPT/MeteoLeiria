//
//  DayCollectionViewCell.swift
//  MeteoLeiria
//
//  Created by Tiago Dias on 11/06/2017.
//  Copyright © 2017 Tiago Dias. All rights reserved.
//

import UIKit

class DayCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var day: UILabel!
    
    func customise(forecast: ForecastType) {
        day.text = forecast.day == "today" ? "Hoje" : forecast.day // Solve this with the API - This is definitely not the best approach
        
        day.textColor = UIColor.white
        
        layer.cornerRadius = 4
        layer.borderColor = UIColor(white: 1, alpha: 0.3).cgColor
        layer.borderWidth = 1
        
        backgroundColor = UIColor(white: 1, alpha: 0.2)
    }
    
}
