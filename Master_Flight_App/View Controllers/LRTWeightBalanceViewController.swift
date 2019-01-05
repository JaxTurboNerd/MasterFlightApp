//
//  WeightBalanceViewController.swift
//  Master_Flight_App
//
//  Created by Gregory Boyd on 12/11/18.
//  Copyright © 2018 Gregory Boyd. All rights reserved.
//

import UIKit

class LRTWeightBalanceViewController: UIViewController {
    //Outlets for labels:
    @IBOutlet weak var pilotWB: AllowedCharsTextField!
    @IBOutlet weak var copilotWB: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func closeWBView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

