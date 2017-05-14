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
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func executeAnimation(withDuration duration:Double, andDelay delay:Double, animationOptions options:UIViewAnimationOptions) -> Void {
        
        moveObjectView.isHidden = false
        
        moveObjectView.frame = startView.frame
        
        moveObjectView.backgroundColor = startView.backgroundColor
        
        UIView.animate(withDuration: duration,
                       delay: delay, options: options,
                       animations: { () in
                        
                        self.moveObjectView.frame = self.stopView.frame
                        
                       },
                       completion: nil)
        
    }
    
}
