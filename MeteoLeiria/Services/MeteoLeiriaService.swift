//
//  MeteoLeiriaService.swift
//  MeteoLeiria
//
//  Created by Tiago Dias on 12/06/2017.
//  Copyright © 2017 Tiago Dias. All rights reserved.
//

import Foundation

enum BackendError: Error {
    case urlError(reason: String)
    case objectSerialization(reason: String)
}

final class MeteoLeiriaService: NSObject {
    private let apiConfig: APIConfig
    
    init(apiConfig: APIConfig = APIConfig.meteoLeiriaConfig()) {
        self.apiConfig = apiConfig
        super.init()
    }
    
    private func getWeather(completionHandler: @escaping (JSONRequestResult) -> Void) {
        
        let url = URL.createAPIURL(withConfig: apiConfig)
        guard let aUrl = url else {
            completionHandler(.failure(error: BackendError.urlError(reason: "Failed to create URL")))
            return
        }
        
        requestGET(aUrl, apiConfig: apiConfig, completionHandler: completionHandler)
    }
    
    private func requestGET(_ url: URL, apiConfig: APIConfig, completionHandler: @escaping (JSONRequestResult) -> Void) {
        
        let urlRequest = URLRequest(url: url)
        let session = URLSession.shared
        
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            DispatchQueue.main.async {
                
                guard error == nil else {
                    print ("Error: \(error!.localizedDescription)")
                    completionHandler(JSONRequestResult.failure(error: error!))
                    return
                }
                
                // make sure we got data in the response
                guard let responseData = data else {
                    print("Error: did not receive data")
                    let error = BackendError.objectSerialization(reason: "No data in response")
                    completionHandler(.failure(error: error))
                    return
                }
                // Decode
                let decoder = JSONDecoder()
                do {
                    let forecast = try decoder.decode(Weather.self, from: responseData)
                    completionHandler(.success(data: forecast))
                 } catch {
                    print ("Error trying to convert data to JSON")
                    print (error.localizedDescription)
                    completionHandler(.failure(error: error))
                }
            }
        }
        task.resume()
    }
}

extension MeteoLeiriaService: WeatherRequest {
    func getWeatherData(completionHandler: @escaping (JSONRequestResult) -> Void) {
        getWeather(completionHandler: completionHandler)
    }
}

