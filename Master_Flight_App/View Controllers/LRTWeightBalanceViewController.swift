//
//  WeightBalanceViewController.swift
//  Master_Flight_App
//
//  Created by Gregory Boyd on 12/11/18.
//  Copyright © 2018 Gregory Boyd. All rights reserved.
//

import UIKit

class LRTWeightBalanceViewController: UIViewController {
    
    var finalSelectedAircraft = ""
    
    //Outlets for labels:
    @IBOutlet weak var aircraftNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            aircraftNumberLabel.text = finalSelectedAircraft
    }
    
    //close view controller with "close" button
    @IBAction func dismissVC(_ sender: DesignableButton) {
        //Dismiss THIS view controller
        self.dismiss(animated: true, completion: nil)
        
        //Dismiss the previous popover view controller when hit the close button
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}

