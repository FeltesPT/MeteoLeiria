//
//  APIConfig.swift
//  MeteoLeiria
//
//  Created by Tiago Dias on 11/06/2017.
//  Copyright © 2017 Tiago Dias. All rights reserved.
//

import Foundation

struct APIConfig {
    let apiScheme: String
    let apiHost: String
    let apiPath: String
}

extension APIConfig {
    static func meteoLeiriaForecastConfig() -> APIConfig {
        return APIConfig(
            apiScheme: "http",
            apiHost: "meteoleiria.org",
            apiPath: "data/prevwuleiria.xml"
        )
    }
    
    static func meteoLeiriaCurrentConfig() -> APIConfig {
        return APIConfig (
            apiScheme: "http",
            apiHost: "meteoleiria.org",
            apiPath: "data/wdfulldata.xml"
        )
    }
}
