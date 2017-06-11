//
//  Entry.swift
//  MeteoLeiria
//
//  Created by Tiago Dias on 11/06/2017.
//  Copyright © 2017 Tiago Dias. All rights reserved.
//

import Foundation

protocol Current {
    var time: String { get set }
    var date: String { get set }
    var forecasticonword: String { get set }
    var weathercond: String { get set }
    var temp: String { get set }
    var hum: String { get set }
    var maxtemp: String { get set }
    var maxtempt: String { get set }
    
    // wind
    var gstspd: String { get set }
    var dirlabel: String { get set }
    init()
}

protocol Forecast {
    var icon: String { get set } // http://icons.wxug.com/i/c/k/partlycloudy.gif
    var date: String { get set }
    var weekday: String { get set }
    var maxtemp: String { get set }
    var mintemp: String { get set }
    var avewind: String { get set }
    var avehumidity: String { get set }
}
