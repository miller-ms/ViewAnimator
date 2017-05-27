//
//  OptionsModel.swift
//  ViewAnimator
//
//  Created by William Miller on 5/20/17.
//  Copyright © 2017 Miller Mobilesoft. All rights reserved.
//

import Foundation
import UIKit


class OptionsModel {
    
    var animationOptions:UIViewAnimationOptions = [UIViewAnimationOptions.curveEaseInOut]
    
    init(options: UIViewAnimationOptions) {
        animationOptions = options
    }

}
