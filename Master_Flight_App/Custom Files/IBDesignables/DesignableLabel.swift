//
//  DesignableLabel.swift
//  Master_Flight_App
//
//  Created by Gregory Boyd on 12/29/18.
//  Copyright © 2018 Gregory Boyd. All rights reserved.
//

import UIKit

@IBDesignable class DesignableLabel: UILabel {
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
        
}
