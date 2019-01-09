//
//  AircraftTableViewCell.swift
//  Master_Flight_App
//
//  Created by Gregory Boyd on 1/5/19.
//  Copyright © 2019 Gregory Boyd. All rights reserved.
//

import UIKit

class AircraftTableViewCell: UITableViewCell {
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var aircraftLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cardView.layer.shadowOpacity = 1
        cardView.layer.shadowOffset = CGSize.zero
        cardView.layer.shadowColor = UIColor.darkGray.cgColor
        cardView.layer.cornerRadius = 10
    }
    
    func setup(title: String) {
        aircraftLabel.text = title
    }
}
