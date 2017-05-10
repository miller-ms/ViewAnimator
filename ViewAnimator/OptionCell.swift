//
//  OptionCell.swift
//  ViewAnimator
//
//  Created by William Miller on 5/7/17.
//  Copyright © 2017 Miller Mobilesoft. All rights reserved.
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
    
    case unknownId = "unknown"
    
}

class OptionCell: UITableViewCell {
    
    let tagLabel = 1
    let tagSlider = 2
    
    
    var lblOption: UILabel  {
        
        return self.viewWithTag(tagLabel) as! UILabel
        
    }
    
    var toggleOption: UISwitch {
        return self.viewWithTag(tagSlider) as! UISwitch
    }
    
    func cellId () -> OptionCellIds {
        
        switch lblOption.text! {
        case OptionCellIds.repeatId.rawValue:
            return OptionCellIds.repeatId
        case OptionCellIds.autoReverseId.rawValue:
            return OptionCellIds.autoReverseId
            
        case OptionCellIds.curveEaseInOutId.rawValue:
            return OptionCellIds.curveEaseInOutId
        case OptionCellIds.curveEaseInId.rawValue:
            return OptionCellIds.curveEaseInId
        case OptionCellIds.curveEaseOutId.rawValue:
            return OptionCellIds.curveEaseOutId
        case OptionCellIds.curveLinearId.rawValue:
            return OptionCellIds.curveLinearId
            
        case OptionCellIds.transitionFlipFromLeftId.rawValue:
            return OptionCellIds.transitionFlipFromLeftId
        case OptionCellIds.transitionFlipFromRightId.rawValue:
            return OptionCellIds.transitionFlipFromRightId
        case OptionCellIds.transitionCurlUpId.rawValue:
            return OptionCellIds.transitionCurlUpId
        case OptionCellIds.transitionCurlDownId.rawValue:
            return OptionCellIds.transitionCurlDownId
        case OptionCellIds.transitionCrossDissolveId.rawValue:
            return OptionCellIds.transitionCrossDissolveId
        case OptionCellIds.transitionFlipFromTopId.rawValue:
            return OptionCellIds.transitionFlipFromTopId
        case OptionCellIds.transitionFlipFromBottomId.rawValue:
            return OptionCellIds.transitionFlipFromBottomId
        
        case OptionCellIds.preferredFramesPerSecond30Id.rawValue:
            return OptionCellIds.preferredFramesPerSecond30Id
        case OptionCellIds.preferredFramesPerSecond60Id.rawValue:
            return OptionCellIds.preferredFramesPerSecond60Id
            
        default:
            return OptionCellIds.unknownId
            
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
