//
//  TransitionCell.swift
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

class TransitionCell: UITableViewCell {

    @IBOutlet var sourceView: UIImageView!
    @IBOutlet var destView: UIImageView!
    @IBOutlet weak var slideView: UIView!
    @IBOutlet weak var transitionBtn: UIButton!
    
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
        
        
        transitionBtn.isEnabled = false
        UIView.transition(from: sourceView,
                          to: destView,
                          duration: duration,
                          options: options,
                          completion: {_ in
                            let tempView = self.sourceView;
                            self.sourceView = self.destView;
                            self.destView = tempView
                            self.slideView.insertSubview(self.destView, belowSubview: self.sourceView)
                            let viewConstraints = [NSLayoutConstraint.init(item: self.destView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: self.slideView.bounds.height),
                                                   NSLayoutConstraint.init(item: self.destView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: self.slideView.bounds.width),
                                                   NSLayoutConstraint.init(item: self.destView, attribute: .left, relatedBy: .equal, toItem: self.slideView, attribute: .left, multiplier: 1, constant: 0),
                                                   NSLayoutConstraint.init(item: self.destView, attribute: .top, relatedBy: .equal, toItem: self.slideView, attribute: .top, multiplier: 1, constant: 0)]
                            
                            self.slideView.addConstraints(viewConstraints)
                            self.transitionBtn.isEnabled = true

                          }
                        
                        
        )
        
    }


}
