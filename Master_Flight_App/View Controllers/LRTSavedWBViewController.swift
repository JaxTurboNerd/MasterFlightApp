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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectedAircraft.text = globalSelectedAircraft
        ZFW.text = globalZeroFuelWeight
        basicWeight.text = globalBasicWeight
        grossWeight.text = globalGrossWeight
        centerOfGravity.text = globalCenterOfGravity
        pilotWeight.text = globalPilotWeight
        copilotWeight.text = globalCoPilotWeight
        fEWeight.text = globalFEWeight
        fSOWeight.text = globalFlightStationObsWeight
        portFwdObsWeight.text = globalPortFwdObsWeight
        stbFwdObsWeight.text = globalStbFwdObsWeight
        tFO1Weight.text = globalTFO1Weight
        tFO2Weight.text = globalTFO2Weight
        tFO3Weight.text = globalTFO3Weight
        tFO4Weight.text = globalTFO4Weight
        firstClassWeight.text = globalFirstClassWeight
        aftFirstClassWeight.text = globalAftFirstClassWeight
        portAftObsWeight.text = globalPortAftObsWeight
        stbAftObsWeight.text = globalStbAftObsWeight
        tank1Weight.text = globalTank1Weight
        tank2Weight.text = globalTank2Weight
        tank3Weight.text = globalTank3Weight
        tank4Weight.text = globalTank4Weight
        tank5Weight.text = globalTank5Weight
        cargoBWeight.text = globalCargoBWeight
        cargoCWeight.text = globalCargoCWeight
        cargoDWeight.text = globalCargoDWeight
        cargoEWeight.text = globalCargoEWeight
        cargoFWeight.text = globalCargoFWeight
        cargoGWeight.text = globalCargoGWeight
        bombBayWeight.text = globalBombBayWeight
    }
}
