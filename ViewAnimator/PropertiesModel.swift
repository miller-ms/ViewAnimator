//
//  PropertiesModel.swift
//  ViewAnimator
//
//  Created by William Miller DBA Miller Mobilesoft on 5/22/17.
//
//  This application is intended to be a developer tool for evaluating the
//  options for creating an animation or transition using the UIView static
//  methods UIView.animate and UIView.transition.
//  Copyright © 2017 William Miller DBA Miller Mobilesoft
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.
//
//  If you would like to reach the developer you may email me at
//  support@millermobilesoft.com or visit my website at
//  http://millermobilesoft.com
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
