//
//  UIColor+Extensions.swift
//  MeteoLeiria
//
//  Created by Tiago Dias on 20/06/2017.
//  Copyright © 2017 Tiago Dias. All rights reserved.
//

import UIKit

extension UIColor {
    public static var borderWhite: UIColor {
        return UIColor(white: 1, alpha: 0.3)
    }
    
    public static var backgroundWhite: UIColor {
        return UIColor(white: 1, alpha: 0.2)
    }
    
    public static var highlightedBackgroundWhite: UIColor {
        return UIColor(white: 1, alpha: 0.7)
    }
    
    public static var selectedBackgroundWhite: UIColor {
        return UIColor(white: 1, alpha: 0.5)
    }
    
    public static var grandientLightBlue: UIColor {
        return UIColor(colorLiteralRed: 44/255, green: 140/255, blue: 174/255, alpha: 1)
    }
    
    public static var grandientDarkBlue: UIColor {
        return UIColor(colorLiteralRed: 4/255, green: 90/255, blue: 171/255, alpha: 1)
    }
    
    public static var gradientLightOrange: UIColor {
        return UIColor(colorLiteralRed: 244/255, green: 200/255, blue: 156/255, alpha: 1)
    }
    
    public static var gradientDarkOrange: UIColor {
        return UIColor(colorLiteralRed: 255/255, green: 130/255, blue: 95/255, alpha: 1)
    }
}
