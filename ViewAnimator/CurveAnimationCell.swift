//
//  CurveAnimationCell.swift
//  ViewAnimator
//
//  Created by William Miller on 5/10/17.
//  Copyright © 2017 Miller Mobilesoft. All rights reserved.
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
