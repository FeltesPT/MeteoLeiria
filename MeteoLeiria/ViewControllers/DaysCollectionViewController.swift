//
//  DaysCollectionViewController.swift
//  MeteoLeiria
//
//  Created by Tiago Dias on 11/06/2017.
//  Copyright © 2017 Tiago Dias. All rights reserved.
//

import UIKit

protocol DayCollectionViewCellDelegate {
    func indexSelected(indexPath: IndexPath)
}

final class DaysCollectionViewController: UICollectionViewController {
    
    private let reuseIdentifier = "DayCell"
    
    public var weather: Weather?
    public var delegate: DayCollectionViewCellDelegate?
    
    public func refresh() {
        collectionView?.reloadData()
        
        let firstIndexPath = IndexPath(row: 0, section: 0)
        collectionView?.selectItem(at: firstIndexPath, animated: true, scrollPosition: .centeredHorizontally)
    }
    
    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weather?.forecast.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? DayCollectionViewCell else {
            fatalError("Wrong cell type")
        }
        
        guard let forecast = weather?.forecast[indexPath.row] else {
            return cell
        }
        
        if indexPath.row == 0 {
            cell.customiseToday(forecast: forecast)
            cell.isSelected = true
        } else {
            cell.customise(forecast: forecast)
        }
        
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
        delegate?.indexSelected(indexPath: indexPath)
    }
}
