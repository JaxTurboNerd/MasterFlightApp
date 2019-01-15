//
//  AEWWeightBalanceViewController.swift
//  Master_Flight_App
//
//  Created by Gregory Boyd on 1/9/19.
//  Copyright © 2019 Gregory Boyd. All rights reserved.
//

import UIKit

class AEWWeightBalanceViewController: UIViewController {
    var finalSelectedAircraft = ""
    
    @IBOutlet weak var aircraftNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aircraftNumberLabel.text = finalSelectedAircraft
    }
    

    @IBAction func dismissVC(_ sender: DesignableButton) {
        //dismiss current view controller
        self.dismiss(animated: true, completion: nil)
        
        //dismiss popover vc:
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
