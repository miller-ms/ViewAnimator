//
//  TransitionCell.swift
//  ViewAnimator
//
//  Created by William Miller on 5/10/17.
//  Copyright © 2017 Miller Mobilesoft. All rights reserved.
//

import UIKit

class TransitionCell: UITableViewCell {

    @IBOutlet var sourceView: UIImageView!
    @IBOutlet var destView: UIImageView!
    @IBOutlet weak var slideView: UIView!
    
//    var toView:UIImageView!
//    var fromView:UIImageView!
    
    var imageNames = ["xdest.png", "xsource.png"]
    
    var nextImage = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func executeTransition(withDuration duration:Double, animationOptions options:UIViewAnimationOptions) -> Void {
        
        UIView.transition(from: sourceView,
                          to: destView,
                          duration: duration,
                          options: options, completion: {_ in
                            let tempView = self.sourceView;
                            self.sourceView = self.destView;
                            self.destView = tempView
                            self.slideView.insertSubview(self.destView, belowSubview: self.sourceView)
                            let viewConstraints = [NSLayoutConstraint.init(item: self.destView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: self.slideView.bounds.height),
                                                   NSLayoutConstraint.init(item: self.destView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: self.slideView.bounds.width),
                                                   NSLayoutConstraint.init(item: self.destView, attribute: .left, relatedBy: .equal, toItem: self.slideView, attribute: .left, multiplier: 1, constant: 0),
                                                   NSLayoutConstraint.init(item: self.destView, attribute: .top, relatedBy: .equal, toItem: self.slideView, attribute: .top, multiplier: 1, constant: 0)]
                            
                            self.slideView.addConstraints(viewConstraints)

                          }
        )
        
        
    }


}
