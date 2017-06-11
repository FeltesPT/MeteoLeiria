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
    @IBOutlet weak var hour: UILabel!
    @IBOutlet weak var date: UILabel!
    
    func customise(forecast: Forecast) {
        
    }
    
    func customise(current: Current) {
        day.text = dayFromInt(dayInt: NSDateComponents().weekday)
        date.text = current.date
        
    }
    
    func dayFromInt(dayInt: Int) -> String {
        switch dayInt {
        case 0:
            return "Domingo"
        case 1:
            return "Segunda"
        case 2:
            return "Terça"
        case 3:
            return "Quarta"
        case 4:
            return "Quinta"
        case 5:
            return "Sexta"
        default:
            return "Sábado"
        }
    }
}
