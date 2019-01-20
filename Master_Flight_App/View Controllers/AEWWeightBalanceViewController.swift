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
    
    //Outlets for labels:
    @IBOutlet weak var aircraftNumberLabel: UILabel!
    @IBOutlet weak var basicWeightLabel: UILabel!
    @IBOutlet weak var zfwLabel: UILabel!
    @IBOutlet weak var grossWeightLabel: UILabel!
    @IBOutlet weak var cgLabel: UILabel!
    
    //Outlets for textfields:
    @IBOutlet weak var pilotWeight: AllowedCharsTextField!
    @IBOutlet weak var copilotWeight: AllowedCharsTextField!
    @IBOutlet weak var feWeight: AllowedCharsTextField!
    @IBOutlet weak var fwdObserverWeight: AllowedCharsTextField!
    @IBOutlet weak var radarCompartmentWeight: AllowedCharsTextField!
    @IBOutlet weak var tfo1Weight: AllowedCharsTextField!
    @IBOutlet weak var tfo2Weight: AllowedCharsTextField!
    @IBOutlet weak var tfo4Weight: AllowedCharsTextField!
    @IBOutlet weak var tfo3Weight: AllowedCharsTextField!
    @IBOutlet weak var firstClassWeight: AllowedCharsTextField!
    @IBOutlet weak var portAftObserverWeight: AllowedCharsTextField!
    @IBOutlet weak var stbAftObserverWeight: AllowedCharsTextField!
    @IBOutlet weak var galleyWeight: AllowedCharsTextField!
    @IBOutlet weak var bunkWeight: AllowedCharsTextField!
    @IBOutlet weak var tanks1and4Weight: AllowedCharsTextField!
    @IBOutlet weak var tanks2and3Weight: AllowedCharsTextField!
    @IBOutlet weak var tank5Weight: AllowedCharsTextField!
    @IBOutlet weak var cargoBweight: AllowedCharsTextField!
    @IBOutlet weak var cargoCweight: AllowedCharsTextField!
    @IBOutlet weak var cargoDweight: AllowedCharsTextField!
    @IBOutlet weak var cargoEweight: AllowedCharsTextField!
    @IBOutlet weak var cargoFweight: AllowedCharsTextField!
    @IBOutlet weak var cargoGweight: AllowedCharsTextField!
    @IBOutlet weak var bombBayWeight: AllowedCharsTextField!
    @IBOutlet weak var AftFirstClassWeight: AllowedCharsTextField!
    
    
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
