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
    
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? UIColor.highlightedBackgroundWhite : UIColor.backgroundWhite
        }
    }
    
    override var isSelected: Bool {
        didSet {
            backgroundColor = isSelected ? UIColor.selectedBackgroundWhite : UIColor.backgroundWhite
        }
    }
    
    func customiseToday(forecast: ForecastType) {
        day.text = "Hoje"
        
        commonInit()
    }
    
    func customise(forecast: ForecastType) {
        day.text = forecast.day
        
        commonInit()
    }
    
    private func commonInit() {
        day.textColor = UIColor.white
        
        layer.cornerRadius = 8
        layer.borderColor = UIColor.borderWhite.cgColor
        layer.borderWidth = 3
        
        backgroundColor = UIColor.backgroundWhite
    }
    
}
