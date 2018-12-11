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
        
        //let layer = CALayer
        layer.borderWidth = 3/UIScreen.main.nativeScale
        layer.shadowColor = UIColor.black.cgColor
        contentEdgeInsets = UIEdgeInsets.init(top: 2, left: 5, bottom: 2, right: 5)
        titleLabel?.adjustsFontForContentSizeCategory = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.borderColor = isEnabled ? tintColor.cgColor : UIColor.black.cgColor
    }
}

class RoundedButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.borderWidth = 3/UIScreen.main.nativeScale
        layer.shadowColor = UIColor.lightGray.cgColor
        contentEdgeInsets = UIEdgeInsets.init(top: 0, left: 16, bottom: 0, right: 16)
        titleLabel?.adjustsFontForContentSizeCategory = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height/4
        //layer.borderColor = isEnabled ? tintColor.cgColor : UIColor.lightGray.cgColor
    }
}
