//
//  DesignableView.swift
//  Master_Flight_App
//
//  Created by Gregory Boyd on 12/18/18.
//  Copyright © 2018 Gregory Boyd. All rights reserved.
//

import UIKit

@IBDesignable class DesignableView: UIView {
    //Set the corner radius with the IB
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
}
