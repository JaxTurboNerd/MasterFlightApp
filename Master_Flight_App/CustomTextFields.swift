//
//  CustomTextFields.swift
//  CustomTextField
//
//  Created by Gregory Boyd on 12/18/17.
//  Copyright © 2017 Gregory Boyd. All rights reserved.
//

import UIKit

class MaxLengthTextField: UITextField, UITextFieldDelegate {
    
    private var characterLimit: Int?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        delegate = self
        self.layer.cornerRadius = 5.0
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.borderWidth = 2.0
        //self.textColor = UIColor.red
    }
    
    @IBInspectable var maxLength: Int {
        get {
            guard let length = characterLimit else {
                return Int.max
            }
            return length
        }
        set {
            characterLimit = newValue
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard string.count > 0 else {
            return true
        }
        
        let currentText = textField.text ?? ""
        let prospectiveText = (currentText as NSString).replacingCharacters(in: range, with: string)
        
        return allowedIntoTextField(text: prospectiveText)
    }
    
    func allowedIntoTextField(text: String) -> Bool {
        return text.count <= maxLength
    }
    
}

class AllowedCharsTextField: MaxLengthTextField {
    
    @IBInspectable var allowedChars: String = ""
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        delegate = self
        autocorrectionType = .no
    }
    
    override func allowedIntoTextField(text: String) -> Bool {
        return super.allowedIntoTextField(text: text) &&
            text.containsOnlyCharactersIn(matchCharacters: allowedChars)
    }
    
}

private extension String {
    
    // Returns true if the string contains only characters found in matchCharacters.
    func containsOnlyCharactersIn(matchCharacters: String) -> Bool {
        let disallowedCharacterSet = CharacterSet(charactersIn: matchCharacters).inverted
        return self.rangeOfCharacter(from: disallowedCharacterSet) == nil
    }
    
}

//Class for text field input formats: xx.x or xxx.x, etc.
/*
class FormattedTextField: AllowedCharsTextField {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        delegate = self
        autocorrectionType = .no
    }
    
    @IBInspectable var maxDigitsBeforeDecimal: String = ""
 
    func valid(_ textField:String) -> Bool {
        func roundToPlaces(value:Double, places:Int) -> Double {
            let divisor = pow(10.0, Double(places))
            return round(value * divisor) / divisor
        }
        if let num = Double(textField) {
            if num >= 1000.0 {
                return false
            }
            if roundToPlaces(value:num, places:1) != num {
                return false
            }
            return true
        } else {
            return false
        }
    }
}
*/
