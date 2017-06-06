//
//  OptionCell.swift
//  ViewAnimator
//
//  Created by William Miller DBA Miller Mobilesoft on 5/7/17.
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

enum OptionCellIds:String {
    
    case repeatId = "repeat"
    case autoReverseId = "autoReverse"
    
    case curveEaseInOutId = "curveEaseInOut"
    case curveEaseInId = "curveEaseIn"
    case curveEaseOutId = "curveEaseOut"
    case curveLinearId = "curveLinear"
    
    case transitionFlipFromLeftId = "transitionFlipFromLeft"
    case transitionFlipFromRightId = "transitionFlipFromRight"
    case transitionCurlUpId = "transitionCurlUp"
    case transitionCurlDownId = "transitionCurlDown"
    case transitionCrossDissolveId = "transitionCrossDissolve"
    case transitionFlipFromTopId = "transitionFlipFromTop"
    case transitionFlipFromBottomId = "transitionFlipFromBottom"
    
    case preferredFramesPerSecond30Id = "preferredFramesPerSecond30"
    case preferredFramesPerSecond60Id = "preferredFramesPerSecond60"
    
//    case unknownId = "unknown"
    
}

class OptionCell: UITableViewCell {
    
    let tagLabel = 1
    let tagSlider = 2
    
    var isOn: Bool {
        get {
            if accessoryType == .checkmark {
                return true
            }
            
            return false
        }
        set {
            if newValue {
                accessoryType = .checkmark
            } else {
                accessoryType = .none
            }
        }
    }
    
    var isOff: Bool {
        get {
            if accessoryType == .checkmark {
                return false
            }
            
            return true
        }
        set {
            if newValue {
                accessoryType = .none
            } else {
                accessoryType = .checkmark
            }
        }
    }

    
    func toggle() {
        
        if isOn {
            isOn = false
        } else {
            isOn = true
        }
    }
    
    var lblOption: UILabel  {
        
        return self.viewWithTag(tagLabel) as! UILabel
        
    }
    
    var toggleOption: UISwitch {
        return self.viewWithTag(tagSlider) as! UISwitch
    }
    
    func cellId () -> OptionCellIds {
        
        guard let option = OptionCellIds(rawValue: lblOption.text!) else {
            fatalError("Invalid option cell")
        }
        switch option {
        case .repeatId:
            return .repeatId
        case .autoReverseId:
            return .autoReverseId
            
        case .curveEaseInOutId:
            return .curveEaseInOutId
        case .curveEaseInId:
            return .curveEaseInId
        case .curveEaseOutId:
            return .curveEaseOutId
        case .curveLinearId:
            return .curveLinearId
            
        case .transitionFlipFromLeftId:
            return .transitionFlipFromLeftId
        case .transitionFlipFromRightId:
            return .transitionFlipFromRightId
        case .transitionCurlUpId:
            return .transitionCurlUpId
        case .transitionCurlDownId:
            return .transitionCurlDownId
        case .transitionCrossDissolveId:
            return .transitionCrossDissolveId
        case .transitionFlipFromTopId:
            return .transitionFlipFromTopId
        case .transitionFlipFromBottomId:
            return .transitionFlipFromBottomId
        
        case .preferredFramesPerSecond30Id:
            return .preferredFramesPerSecond30Id
        case .preferredFramesPerSecond60Id:
            return .preferredFramesPerSecond60Id
            
//        default:
//            return .unknownId
            
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        print("Selected: \(selected) Animated \(animated)")

        // Configure the view for the selected state
    }
    
}
