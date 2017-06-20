//
//  URL+Extensions.swift
//  MeteoLeiria
//
//  Created by Tiago Dias on 12/06/2017.
//  Copyright © 2017 Tiago Dias. All rights reserved.
//

import Foundation

extension URL {
    static func createAPIURL(withConfig config: APIConfig, path: String? = nil, parameters: [String: String]? = nil) -> URL? {
        var components = URLComponents()
        components.scheme = config.apiScheme
        components.host = config.apiHost
        components.path = "/\(config.apiPath)"
        
        return components.url
    }
}
