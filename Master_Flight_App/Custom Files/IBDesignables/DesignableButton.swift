//
//  DesignableButton.swift
//  Master_Flight_App
//
//  Created by Gregory Boyd on 12/18/18.
//  Copyright © 2018 Gregory Boyd. All rights reserved.
//

import UIKit

@IBDesignable class DesignableButton: UIButton {
    //Set border width properties with the Interface Builder
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    //Set the border color properties with the Interface Builder
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    //Set the corner radius with the IB
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
}
