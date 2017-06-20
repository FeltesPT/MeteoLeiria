//
//  UILabel+Extensions.swift
//  MeteoLeiria
//
//  Created by Tiago Dias on 20/06/2017.
//  Copyright © 2017 Tiago Dias. All rights reserved.
//

import UIKit

extension UILabel {
    func animateToFont(_ font: UIFont, withDuration duration: TimeInterval) {
        let oldFont = self.font
        self.font = font
        let labelScale = oldFont!.pointSize / font.pointSize
        let oldTransform = transform
        transform = transform.scaledBy(x: labelScale, y: labelScale)
        setNeedsUpdateConstraints()
        UIView.animate(withDuration: duration) {
            self.transform = oldTransform
            self.layoutIfNeeded()
        }
    }
}
