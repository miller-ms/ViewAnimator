//
//  CurveAnimationCell.swift
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

import UIKit

class CurveAnimationCell: UITableViewCell {
    
    @IBOutlet weak var stopView: UIView!
    @IBOutlet weak var startView: UIView!
    @IBOutlet weak var moveObjectView: UIImageView!
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var animateBtn: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func reset() {
        stopView.isHidden = false
        startView.isHidden = false
        moveObjectView.isHidden = true
        colorView.isHidden = true
        
        colorView.layer.removeAllAnimations()
        imageView?.layer.removeAllAnimations()
        
        colorView.transform = CGAffineTransform.identity
        colorView.frame = startView.frame
    }

    func executeAnimation(withDuration duration:Double, andDelay delay:Double, animationOptions options:UIViewAnimationOptions, animationProperties properties:PropertiesModel) -> Void {
        
        // Make the animation view visible and hide the start and stop views.
        colorView.isHidden = false
        startView.isHidden = true
        stopView.isHidden = true
        
        // disable the animate button
        animateBtn.isEnabled = false
        
        /* position the start of the animation view and its final resting place based on the direction of the animation.
         */
        colorView.transform = CGAffineTransform.identity
        colorView.frame = startView.frame
        
        var finalFrame = stopView.frame
        
        // initialize the starting dimensions of the animation view.
        finalFrame.size = properties.applyMulitiplier(toSize: self.colorView.frame.size)
        
        switch properties.animationVector {
        case .leftToRight:
            finalFrame.origin.x = stopView.frame.origin.x + stopView.frame.width - finalFrame.width
            break;

            
        case .rightToLeft:
            colorView.frame.origin = stopView.frame.origin
            finalFrame.origin = startView.frame.origin
            
        case .still:
            var centerPt = stopView.center
            
            centerPt.x = (stopView.center.x + startView.center.x) / 2
            colorView.center = centerPt
            finalFrame.origin = colorView.frame.origin
            
        }
        

        // initialize the starting color of the animation view.
        colorView.backgroundColor = properties.startBackgroundColor
        colorView.alpha = CGFloat(properties.startBackgroundAlpha)
        
        UIView.animate(withDuration: duration,
                       delay: delay,
                       options: options,
                       animations: { () in
                        
                        self.colorView.frame = finalFrame
                        self.colorView.backgroundColor = properties.endBackgroundColor
                        self.colorView.alpha = CGFloat(properties.endBackgroundAlpha)
                        self.colorView.transform = properties.affineTransform
                        
                       },
                       completion: { (isDone:Bool) in
                        self.animateBtn.isEnabled = true
        })
        

    }
    
}
