//
//  LRTFinalWBViewController.swift
//  Master_Flight_App
//
//  Created by Gregory Boyd on 1/26/19.
//  Copyright © 2019 Gregory Boyd. All rights reserved.
//

import UIKit

class LRTSavedWBViewController: UIViewController {
    
    @IBOutlet weak var savedSelectedAircraft: UILabel!
    @IBOutlet weak var savedBasicWeight: UILabel!
    @IBOutlet weak var savedZFW: UILabel!
    @IBOutlet weak var savedGrossWeight: UILabel!
    @IBOutlet weak var savedCenterOfGravity: UILabel!
    @IBOutlet weak var savedPilotWeight: UILabel!
    @IBOutlet weak var savedCopilotWeight: UILabel!
    @IBOutlet weak var savedFEWeight: UILabel!
    @IBOutlet weak var savedFSOWeight: UILabel!
    @IBOutlet weak var savedPortFwdObsWeight: UILabel!
    @IBOutlet weak var savedStbFwdObsWeigh: UILabel!
    @IBOutlet weak var savedFwdCargoWeight: UILabel!
    @IBOutlet weak var savedTFO1Weight: UILabel!
    @IBOutlet weak var savedTFO2Weight: UILabel!
    @IBOutlet weak var savedTFO3Weight: UILabel!
    @IBOutlet weak var savedTFO4Weight: UILabel!
    @IBOutlet weak var savedFirstClassWeight: UILabel!
    @IBOutlet weak var savedPortAftObsWeight: UILabel!
    @IBOutlet weak var savedStbAftObsWeight: UILabel!
    @IBOutlet weak var savedGalleyWeight: UILabel!
    @IBOutlet weak var savedBunkWeight: UILabel!
    @IBOutlet weak var savedFuel1and4Weight: UILabel!
    @IBOutlet weak var savedFuel2and3Weight: UILabel!
    @IBOutlet weak var savedTank5Weight: UILabel!
    @IBOutlet weak var savedCargoBWeight: UILabel!
    @IBOutlet weak var savedCargoCWeight: UILabel!
    @IBOutlet weak var savedCargoDWeight: UILabel!
    @IBOutlet weak var savedCargoEWeight: UILabel!
    @IBOutlet weak var savedCargoFWeight: UILabel!
    @IBOutlet weak var savedCargoGWeight: UILabel!
    @IBOutlet weak var savedBombBayWeight: UILabel!
    @IBOutlet weak var savedAftFirstClass: AllowedCharsTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        savedSelectedAircraft.text = globalSelectedAircraft
        savedBasicWeight.text = globalBasicWeight
        savedZFW.text = globalZFW
        savedGrossWeight.text = globalGW
        savedCenterOfGravity.text = globalCG
        savedPilotWeight.text = globalPilotWeight
        savedCopilotWeight.text = globalCoPilotWeight
        savedFEWeight.text = globalFEWeight
        savedFSOWeight.text =  globalFSOWeight
        savedPortFwdObsWeight.text = globalPortFwdObsWeight
        savedStbFwdObsWeigh.text = globalStbFwdObsWeight
        savedFwdCargoWeight.text = globalFwdCargoWeight
        savedTFO1Weight.text = globalTfo1weight
        savedTFO2Weight.text = globalTfo2weight
        savedTFO3Weight.text = globalTfo3weight
        savedTFO4Weight.text = globalTfo4Weight
        savedPortAftObsWeight.text = globalPortAftObsWeight
        savedStbAftObsWeight.text = globalStbAftObsWeight
        savedGalleyWeight.text = globalGalleyWeight
        savedBunkWeight.text = globalBunkWeight
        savedFuel1and4Weight.text = globalTank1and4weight
        savedFuel2and3Weight.text = globalTank2and3weight
        savedTank5Weight.text = globaltank5Weight
        savedCargoBWeight.text = globalCargoBweight
        savedCargoCWeight.text = globalCargoCweight
        savedCargoDWeight.text = globalCargoDweight
        savedCargoEWeight.text = globalCargoEweight
        savedCargoFWeight.text = globalCargoFweight
        savedCargoGWeight.text = globalCargoGweight
    }
}
