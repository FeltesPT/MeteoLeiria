//
//  BaseViewController.swift
//  MeteoLeiria
//
//  Created by Tiago Dias on 11/06/2017.
//  Copyright © 2017 Tiago Dias. All rights reserved.
//

import UIKit

final class BaseViewController: UIViewController {
    
    @IBOutlet weak var gradientView: GradientView!
    
    let serviceManager = ServiceManager()
    var weather: Weather?
    
    private var currentViewController: CurrentViewController?
    private var daysCollectionViewController: DaysCollectionViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
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
        
        if let temp = weather?.current.tempCelsius, temp > 20 {
            gradientView.topGradientColor = UIColor.gradientLightOrange.cgColor
            gradientView.bottomGradientColor = UIColor.gradientDarkOrange.cgColor
            gradientView.commonInit()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let daysVC = segue.destination as? DaysCollectionViewController {
            daysCollectionViewController = daysVC
            daysCollectionViewController?.delegate = self
        } else if let currentVC = segue.destination as? CurrentViewController {
            currentViewController = currentVC
        }
    }
    
}

extension BaseViewController: DayCollectionViewCellDelegate {
    func indexSelected(indexPath: IndexPath) {
        currentViewController?.selectedIndex = indexPath.row
        currentViewController?.refresh()
    }
    
    
}

