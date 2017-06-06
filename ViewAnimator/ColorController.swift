//
//  ColorControllerViewController.swift
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
import SwiftHSVColorPicker

class ColorController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var colorPicker: SwiftHSVColorPicker!
    @IBOutlet weak var fieldRed: UITextField!
    @IBOutlet weak var fieldGreen: UITextField!
    @IBOutlet weak var fieldBlue: UITextField!
        
    var initialColor = UIColor.blue
    var inKeyboardMode = false
    
    var color: UIColor {
        return colorPicker.color
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fieldRed.delegate = self
        fieldGreen.delegate = self
        fieldBlue.delegate = self

        // Do any additional setup after loading the view.
        colorPicker.setViewColor(initialColor)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let red = colorPicker.color.cgColor.components?[0]
        let green = colorPicker.color.cgColor.components?[1]
        let blue = colorPicker.color.cgColor.components?[2]
        
        let formatter = NumberFormatter()
        
        formatter.numberStyle = .decimal
        
        formatter.maximumFractionDigits = 0
        
        formatter.minimumFractionDigits = 0
        
        formatter.maximumIntegerDigits = 3
        
        formatter.minimumIntegerDigits = 1
        
        fieldRed.text = formatter.string(from: NSNumber(value: (UInt(red! * 255))))!
        
        fieldGreen.text = formatter.string(from: NSNumber(value: (UInt(green! * 255))))!

        fieldBlue.text = formatter.string(from: NSNumber(value: (UInt(blue! * 255))))!
        
        NotificationCenter.default.addObserver(self, selector: #selector(ColorController.keyboardWillShow(_:)), name: .UIKeyboardWillShow, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(ColorController.keyboardWillHide(_:)), name: .UIKeyboardWillHide, object: nil)

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */    
    @IBAction func setColorFromValues(_ sender: UIButton) {
        
        let formatter = NumberFormatter()
        
        formatter.numberStyle = .decimal
        
        formatter.maximumFractionDigits = 0
        
        formatter.minimumFractionDigits = 0
        
        formatter.maximumIntegerDigits = 3
        
        formatter.minimumIntegerDigits = 1

        let red = formatter.number(from: fieldRed.text!)
        let green = formatter.number(from: fieldGreen.text!)
        let blue = formatter.number(from: fieldBlue.text!)
        
        colorPicker.setViewColor(UIColor(red: CGFloat((red?.floatValue)!/255), green: CGFloat((green?.floatValue)!/255), blue: CGFloat((blue?.floatValue)!/255), alpha: CGFloat(1.0)))

    }
    
    func keyboardWillShow(_ notification:NSNotification) {
        
        guard  !inKeyboardMode else {
            return
        }
        
        inKeyboardMode = true
        
        if let userInfo = notification.userInfo {
            if let keyboardSize = (userInfo[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
                
                raiseView(byHeight: keyboardSize.height, moveUp: true)
            }
        }
    }
    
    func keyboardWillHide(_ notification:NSNotification) {
        
        guard inKeyboardMode else {
            return
        }
        
        inKeyboardMode = false
        
        if let userInfo = notification.userInfo {
            if let keyboardSize = (userInfo[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
                
                raiseView(byHeight: keyboardSize.height, moveUp: false)
            }
        }
    }
    
    
    func raiseView(byHeight height:CGFloat, moveUp up:Bool) {
        
        var change = height
        
        if up  {
            change = -change
        }
        
        UIView.animate(withDuration: 0.3, animations: {
            self.view.frame = CGRect(x: self.view.frame.origin.x, y: self.view.frame.origin.y + change, width: self.view.frame.width, height: self.view.frame.height)
        })

    }
    @IBAction func resignKeyboard(_ sender: UITapGestureRecognizer) {
        
        guard inKeyboardMode else {
            return
        }
        
        view.endEditing(true)
    }
    
    
}
