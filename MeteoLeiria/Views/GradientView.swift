//
//  GradientView.swift
//  MeteoLeiria
//
//  Created by Tiago Dias on 20/06/2017.
//  Copyright © 2017 Tiago Dias. All rights reserved.
//

import Foundation
import UIKit
/// View for gradient backgrounds, defaults to topBlueGradient into a bottomBlueGraident
/// From the top left to bottom right corners
/// Defaults to 0% opacity
/// The defaults are IBInspectable
open class GradientView: UIView {
    
    let gradientLayer = CAGradientLayer()
    
    public var topGradientColor: CGColor = UIColor.grandientLightBlue.cgColor
    public var bottomGradientColor: CGColor = UIColor.grandientDarkBlue.cgColor
    
    public var startPoint: CGPoint = CGPoint(x:0.5, y:0)
    public var endPoint: CGPoint = CGPoint(x:0.5, y:1)
    
    public var opacity: Float = 1
    
    public var gradientMaskLayer: CALayer?
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }
    
    open override func draw(_ rect: CGRect) {
        super.draw(rect)
        commonInit()
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        gradientLayer.frame = bounds
    }
    
    public func commonInit() {
        backgroundColor = UIColor.clear
        gradientLayer.backgroundColor = UIColor.clear.cgColor
        
        gradientLayer.frame = bounds
        gradientLayer.colors = [
            topGradientColor,
            bottomGradientColor
        ]
        
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        gradientLayer.locations = [0, 1]
        gradientLayer.opacity = opacity
        layer.addSublayer(gradientLayer)
        
        if let gradientMaskLayer = gradientMaskLayer {
            gradientLayer.mask = gradientMaskLayer
        }
    }
}
