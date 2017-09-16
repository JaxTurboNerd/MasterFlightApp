//
//  CustomButton.swift
//  Master_Flight_App
//
//  Created by Gregory Boyd on 9/11/17.
//  Copyright © 2017 Gregory Boyd. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.borderWidth = 1/UIScreen.main.nativeScale
        contentEdgeInsets = UIEdgeInsetsMake(2, 5, 2, 5)
        titleLabel?.adjustsFontForContentSizeCategory = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.borderColor = isEnabled ? tintColor.cgColor : UIColor.lightGray.cgColor
    }
}

class RoundedButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.borderWidth = 1/UIScreen.main.nativeScale
        contentEdgeInsets = UIEdgeInsetsMake(0, 16, 0, 16)
        titleLabel?.adjustsFontForContentSizeCategory = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height/2
        layer.borderColor = isEnabled ? tintColor.cgColor : UIColor.lightGray.cgColor
    }
}
