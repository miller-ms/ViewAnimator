//
//  PropertiesModel.swift
//  ViewAnimator
//
//  Created by William Miller on 5/19/17.
//  Copyright © 2017 Miller Mobilesoft. All rights reserved.
//

import Foundation
import UIKit

enum AnimationDirection:Int {
    case leftToRight = 0
    case rightToLeft
    case still
}

class PropertiesModel {
    
    var heightMultiplier = Float(1.0)
    var widthMultiplier = Float (1.0)
    var animationVector = AnimationDirection.leftToRight
    var startBackgroundColor = UIColor.green {
        didSet {
            print("didset")
        }
    }
    
    var endBackgroundColor = UIColor.red
    var startBackgroundAlpha = Float(1.0)
    var endBackgroundAlpha = Float(1.0)
    var affineTransform: CGAffineTransform {
        return CGAffineTransform(rotationAngle: CGFloat(degrees * Float.pi / 180))
    }
    
    var degrees=Float(0.0)
    
    func applyMulitiplier(toSize size:CGSize) -> CGSize {
        return CGSize(width: size.width * CGFloat(widthMultiplier), height: size.height * CGFloat(heightMultiplier))
    }

}
