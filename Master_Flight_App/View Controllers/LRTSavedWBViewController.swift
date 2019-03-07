//
//  LRTFinalWBViewController.swift
//  Master_Flight_App
//
//  Created by Gregory Boyd on 1/26/19.
//  Copyright © 2019 Gregory Boyd. All rights reserved.
//

import UIKit

class LRTSavedWBViewController: UIViewController {
    
    @IBOutlet weak var selectedAircraft: UILabel!
    @IBOutlet weak var basicWeight: UILabel!
    @IBOutlet weak var ZFW: UILabel!
    @IBOutlet weak var grossWeight: UILabel!
    @IBOutlet weak var centerOfGravity: UILabel!
    @IBOutlet weak var pilotWeight: UILabel!
    @IBOutlet weak var copilotWeight: UILabel!
    @IBOutlet weak var fEWeight: UILabel!
    @IBOutlet weak var fSOWeight: UILabel!
    @IBOutlet weak var portFwdObsWeight: UILabel!
    @IBOutlet weak var stbFwdObsWeight: UILabel!
    @IBOutlet weak var fwdCargoWeight: UILabel!
    @IBOutlet weak var tFO1Weight: UILabel!
    @IBOutlet weak var tFO2Weight: UILabel!
    @IBOutlet weak var tFO3Weight: UILabel!
    @IBOutlet weak var tFO4Weight: UILabel!
    @IBOutlet weak var firstClassWeight: UILabel!
    @IBOutlet weak var portAftObsWeight: UILabel!
    @IBOutlet weak var stbAftObsWeight: UILabel!
    @IBOutlet weak var tank1Weight: UILabel!
    @IBOutlet weak var tank2Weight: UILabel!
    @IBOutlet weak var tank3Weight: UILabel!
    @IBOutlet weak var tank4Weight: UILabel!
    @IBOutlet weak var tank5Weight: UILabel!
    @IBOutlet weak var cargoBWeight: UILabel!
    @IBOutlet weak var cargoCWeight: UILabel!
    @IBOutlet weak var cargoDWeight: UILabel!
    @IBOutlet weak var cargoEWeight: UILabel!
    @IBOutlet weak var cargoFWeight: UILabel!
    @IBOutlet weak var cargoGWeight: UILabel!
    @IBOutlet weak var bombBayWeight: UILabel!
    @IBOutlet weak var aftFirstClassWeight: UILabel!
    
    //Initialize variables for data passed from the LRT VC when SAVE button is pressed:
    var finalSelectedAircraft = ""
    var finalZFW = ""
    var finalRoundedZFW = ""
    var finalGW = ""
    var finalRoundedGrossWeight = ""
    var finalBasicWeight = ""
    var finalCG = ""
    var finalPilotWeight = ""
    var finalCoPilotWeight = ""
    var finalFEWeight = ""
    var finalFSOWeight = ""
    var finalPortFwdObsWeight = ""
    var finalStbFwdObsWeight = ""
    var finalFwdCargoWeight = ""
    var finalTfo1weight = ""
    var finalTfo2weight = ""
    var finalTfo3weight = ""
    var finalTfo4Weight = ""
    var finalFirstClassWeight = ""
    var finalAftFirstClassWeight = ""
    var finalPortAftObsWeight = ""
    var finalStbAftObsWeight = ""
    var finalTank1Weight = ""
    var finalTank2Weight = ""
    var finalTank3Weight = ""
    var finalTank4Weight = ""
    var finaltank5Weight = ""
    var finalCargoBweight = ""
    var finalCargoCweight = ""
    var finalCargoDweight = ""
    var finalCargoEweight = ""
    var finalCargoFweight = ""
    var finalCargoGweight = ""
    var finalBombBayWeight = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectedAircraft.text = finalSelectedAircraft
        ZFW.text = finalRoundedZFW
        basicWeight.text = finalBasicWeight
        grossWeight.text = finalGW
        centerOfGravity.text = finalCG
        pilotWeight.text = finalPilotWeight
        copilotWeight.text = finalCoPilotWeight
        fEWeight.text = finalFEWeight
        fSOWeight.text = finalFSOWeight
        portFwdObsWeight.text = finalPortFwdObsWeight
        stbFwdObsWeight.text = finalStbFwdObsWeight
        tFO1Weight.text = finalTfo1weight
        tFO2Weight.text = finalTfo1weight
        tFO3Weight.text = finalTfo3weight
        tFO4Weight.text = finalTfo4Weight
        firstClassWeight.text = finalFirstClassWeight
        aftFirstClassWeight.text = finalAftFirstClassWeight
        portAftObsWeight.text = finalPortAftObsWeight
        stbAftObsWeight.text = finalStbAftObsWeight
        tank1Weight.text = finalTank1Weight
        tank2Weight.text = finalTank2Weight
        tank3Weight.text = finalTank3Weight
        tank4Weight.text = finalTank4Weight
        tank5Weight.text = finaltank5Weight
        cargoBWeight.text = finalCargoBweight
        cargoCWeight.text = finalCargoCweight
        cargoDWeight.text = finalCargoDweight
        cargoEWeight.text = finalCargoEweight
        cargoFWeight.text = finalCargoFweight
        cargoGWeight.text = finalCargoGweight
        bombBayWeight.text = finalBombBayWeight
    }
}
