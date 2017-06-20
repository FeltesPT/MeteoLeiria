//
//  BaseViewController.swift
//  MeteoLeiria
//
//  Created by Tiago Dias on 11/06/2017.
//  Copyright © 2017 Tiago Dias. All rights reserved.
//

import UIKit

final class BaseViewController: UIViewController {
    
    let serviceManager = ServiceManager()
    var weather: Weather?
    
    private var currentViewController: CurrentViewController?
    private var daysCollectionViewController: DaysCollectionViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        serviceManager.getWeatherData(completionHandler: { (result) in
            switch result {
            case let .failure(error: error):
                // TODO: Throw error
                print(error.localizedDescription)
                break
            case let .success(weather: entry):
                self.weather = entry
                DispatchQueue.main.async(execute: {
                    self.refreshViewControllers()
                })
            }
        })
    }
    
    private func refreshViewControllers() {
        currentViewController?.weather = weather
        daysCollectionViewController?.weather = weather
        
        currentViewController?.refresh()
        daysCollectionViewController?.refresh()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let daysVC = segue.destination as? DaysCollectionViewController {
            daysCollectionViewController = daysVC
        } else if let currentVC = segue.destination as? CurrentViewController {
            currentViewController = currentVC
        }
    }
    
}

