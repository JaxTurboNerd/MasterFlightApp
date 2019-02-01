//
//  WeightBalanceViewController.swift
//  Master_Flight_App
//
//  Created by Gregory Boyd on 12/11/18.
//  Copyright © 2018 Gregory Boyd. All rights reserved.
//

import UIKit

//Global variables to push to FinalWB view controller:
var globalSelectedAircraft = ""
var globalBasicWeight = ""
var globalGW = ""
var globalRoundedGrossWeight = ""
var globalZFW = ""
var globalRoundedZFW = ""
var globalCG = ""
var globalPilotWeight = ""
var globalCoPilotWeight = ""
var globalFEWeight = ""
var globalFSOWeight = ""
var globalPortFwdObsWeight = ""
var globalStbFwdObsWeight = ""
var globalFwdCargoWeight = ""
var globalTfo1weight = ""
var globalTfo2weight = ""
var globalTfo3weight = ""
var globalTfo4Weight = ""
var globalFirstClassWeight = ""
var globalPortAftObsWeight = ""
var globalStbAftObsWeight = ""
var globalGalleyWeight = ""
var globalBunkWeight = ""
var globalTank1and4weight = ""
var globalTank2and3weight = ""
var globaltank5Weight = ""
var globalCargoBweight = ""
var globalCargoCweight = ""
var globalCargoDweight = ""
var globalCargoEweight = ""
var globalCargoFweight = ""
var globalCargoGweight = ""
var globalBombBayWeight = ""
var globalAftFirstClassWeight = ""

class LRTWeightBalanceViewController: UIViewController, UITextFieldDelegate {
    
    var selectedAircraft = ""
    var basicWeight = 0.0
    var aircraftMoment = 0.0
    var aircraftIndex = 0.0
    var aircraftArm = 0.0
    var textFields = [AllowedCharsTextField]()
    
    //Outlets for labels:
    @IBOutlet weak var aircraftNumberLabel: UILabel!
    @IBOutlet weak var basicWeightLabel: UILabel!
    @IBOutlet weak var ZFWLabel: UILabel!
    @IBOutlet weak var grossWeightLabel: UILabel!
    @IBOutlet weak var cgLabel: UILabel!
    
    //Outlets for textfields:
    @IBOutlet weak var pilotWeight: AllowedCharsTextField!
    @IBOutlet weak var coPilotWeight: AllowedCharsTextField!
    @IBOutlet weak var feWeight: AllowedCharsTextField!
    @IBOutlet weak var fsoWeight: AllowedCharsTextField!
    @IBOutlet weak var portFwdObserverWeight: AllowedCharsTextField!
    @IBOutlet weak var stbFwdObserverWeight: AllowedCharsTextField!
    @IBOutlet weak var fwdCargoWeight: AllowedCharsTextField!
    @IBOutlet weak var tfo1Weight: AllowedCharsTextField!
    @IBOutlet weak var tfo2Weight: AllowedCharsTextField!
    @IBOutlet weak var tfo3Weight: AllowedCharsTextField!
    @IBOutlet weak var tfo4Weight: AllowedCharsTextField!
    @IBOutlet weak var firstClassWeight: AllowedCharsTextField!
    @IBOutlet weak var portAftObserverWeight: AllowedCharsTextField!
    @IBOutlet weak var stbAftObserverWeight: AllowedCharsTextField!
    @IBOutlet weak var galleyWeight: AllowedCharsTextField!
    @IBOutlet weak var bunkWeight: AllowedCharsTextField!
    @IBOutlet weak var tanks1and4Weight: AllowedCharsTextField!
    @IBOutlet weak var tanks2and3Weight: AllowedCharsTextField!
    @IBOutlet weak var tank5Weight: AllowedCharsTextField!
    @IBOutlet weak var cargoBWeight: AllowedCharsTextField!
    @IBOutlet weak var cargoCWeight: AllowedCharsTextField!
    @IBOutlet weak var cargoDWeight: AllowedCharsTextField!
    @IBOutlet weak var cargoEWeight: AllowedCharsTextField!
    @IBOutlet weak var cargoFWeight: AllowedCharsTextField!
    @IBOutlet weak var cargoGWeight: AllowedCharsTextField!
    @IBOutlet weak var bombBayWeight: AllowedCharsTextField!
    @IBOutlet weak var aftFirstClassWeight: AllowedCharsTextField!
    
    
    
    //Aircraft dictionary list of Basic Weight, Index, Moment and Arm:
    var aircraftWBList = ["N403SK": [64692, 61.0, 37311.6, 576.8],
                          "N480SK": [64577, 60.6, 37230.8, 576.5],
                          "N741SK": [64692, 61.0, 37311.6, 576.8],
                          "N144CS": [71951, 81.8, 42250.9, 587.2],
                          "N145CS": [72480, 76.8, 42416.9, 585.2],
                          "N146CS": [72280, 78.1, 42335.9, 585.7],
                          "N149CS": [72507, 78.1, 42470.4, 585.7]]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set textfield delegate so Done button resigns first responder:
        //loops through all textfields and assigns each(self) as delegate
        textFields = [pilotWeight, coPilotWeight, feWeight, fsoWeight, portFwdObserverWeight, stbFwdObserverWeight, fwdCargoWeight, tfo1Weight, tfo2Weight, tfo3Weight, tfo4Weight, firstClassWeight, portAftObserverWeight, stbAftObserverWeight, galleyWeight, bunkWeight, tanks1and4Weight, tanks2and3Weight, tank5Weight, cargoBWeight, cargoCWeight, cargoDWeight, cargoEWeight, cargoFWeight, cargoGWeight, bombBayWeight, aftFirstClassWeight]
        
        for field in textFields {
            field.delegate = self
        }
        
        //set the aircraft tail number label to the selected aircraft from the pop over:
        //selectedAircraft passed from WBPopoverViewController
        aircraftNumberLabel.text = selectedAircraft
        globalSelectedAircraft = selectedAircraft
        
        //Switch statement to assign W&B info for the selected aircraft:
        switch selectedAircraft {
        case "N403SK":
            basicWeight = aircraftWBList[selectedAircraft]![0]
            aircraftIndex = aircraftWBList[selectedAircraft]![1]
            aircraftMoment = aircraftWBList[selectedAircraft]![2]
            aircraftArm = aircraftWBList[selectedAircraft]![3]
            
        case "N480SK":
            basicWeight = aircraftWBList[selectedAircraft]![0]
            aircraftIndex = aircraftWBList[selectedAircraft]![1]
            aircraftMoment = aircraftWBList[selectedAircraft]![2]
            aircraftArm = aircraftWBList[selectedAircraft]![3]
            
        case "N741SK":
            basicWeight = aircraftWBList[selectedAircraft]![0]
            aircraftIndex = aircraftWBList[selectedAircraft]![1]
            aircraftMoment = aircraftWBList[selectedAircraft]![2]
            aircraftArm = aircraftWBList[selectedAircraft]![3]
            
        case "N144CS":
            basicWeight = aircraftWBList[selectedAircraft]![0]
            aircraftIndex = aircraftWBList[selectedAircraft]![1]
            aircraftMoment = aircraftWBList[selectedAircraft]![2]
            aircraftArm = aircraftWBList[selectedAircraft]![3]
            
        case "N145CS":
            basicWeight = aircraftWBList[selectedAircraft]![0]
            aircraftIndex = aircraftWBList[selectedAircraft]![1]
            aircraftMoment = aircraftWBList[selectedAircraft]![2]
            aircraftArm = aircraftWBList[selectedAircraft]![3]
            
        case "N146CS":
            basicWeight = aircraftWBList[selectedAircraft]![0]
            aircraftIndex = aircraftWBList[selectedAircraft]![1]
            aircraftMoment = aircraftWBList[selectedAircraft]![2]
            aircraftArm = aircraftWBList[selectedAircraft]![3]
            
        case "N149CS":
            basicWeight = aircraftWBList[selectedAircraft]![0]
            aircraftIndex = aircraftWBList[selectedAircraft]![1]
            aircraftMoment = aircraftWBList[selectedAircraft]![2]
            aircraftArm = aircraftWBList[selectedAircraft]![3]
            
        default:
            break
        }
        //Assign Basic Weight label vaule so it appears when the screen loads:
        basicWeightLabel.text = String(Int(basicWeight))
        
        //dismiss keyboard by tapping anywhere
        self.view.addGestureRecognizer(UITapGestureRecognizer(target:
            self.view, action: #selector(UIView.endEditing(_:))))
        
    }
    //Keyboard DONE button will dismiss the keyboard:
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func calculateWeightBalance(_ sender: DesignableButton) {
        //Check for textfield nil values (can't add a nil value):
        //Create array of textfields to loop through and check all textfields for nil:
        textFields = [pilotWeight, coPilotWeight, feWeight, fsoWeight, portFwdObserverWeight, stbFwdObserverWeight, fwdCargoWeight, tfo1Weight, tfo2Weight, tfo3Weight, tfo4Weight, firstClassWeight, portAftObserverWeight, stbAftObserverWeight, galleyWeight, bunkWeight, tanks1and4Weight, tanks2and3Weight, tank5Weight, cargoBWeight, cargoCWeight, cargoDWeight, cargoEWeight, cargoFWeight, cargoGWeight, bombBayWeight, aftFirstClassWeight]
        
        for field in textFields {
            if field.text?.isEmpty == true {
                field.textColor = UIColor.orange
                field.text = "000"
            }
        }
        
        //create instance variable:
        let weightBalance = LRTWeightBalance()
        
        //Calculate individual totals for addition
        let totalFuel = weightBalance.calculateTotalFuel(tank1and4: Int(tanks1and4Weight.text!)!, tank2and3: Int(tanks2and3Weight.text!)!, tank5: Int(tank5Weight.text!)!)
        let flightStationWeight = weightBalance.calculateFlightStationWeight(pilot: Int(pilotWeight.text!)!, copilot: Int(coPilotWeight.text!)!, flightEngineer: Int(feWeight.text!)!, flightObserver: Int(fsoWeight.text!)!)
        let tubeWeight = weightBalance.calculateTubeWeight(portFwd: Int(portFwdObserverWeight.text!)!, stbFwd: Int(stbFwdObserverWeight.text!)!, tfo1: Int(tfo1Weight.text!)!, tfo2: Int(tfo2Weight.text!)!, tfo3: Int(tfo3Weight.text!)!, tfo4: Int(tfo4Weight.text!)!, firstClass: Int(firstClassWeight.text!)!, portAft: Int(portAftObserverWeight.text!)!, stbAft: Int(stbAftObserverWeight.text!)!, galley: Int(galleyWeight.text!)!, bunk: Int(bunkWeight.text!)!)
        let cargoWeight = weightBalance.calculateCargoWeight(cargoB: Int(cargoBWeight.text!)!, cargoC: Int(cargoCWeight.text!)!, cargoD: Int(cargoDWeight.text!)!, cargoE: Int(cargoEWeight.text!)!, cargoF: Int(cargoFWeight.text!)!, cargoG: Int(cargoGWeight.text!)!, bombBay: Int(bombBayWeight.text!)!, aftFirstClass: Int(aftFirstClassWeight.text!)!)
        let zeroFuelWeight = weightBalance.calculateZFW(basicWeight: Int(basicWeight), flightStationWeight: flightStationWeight, tubeWeight: tubeWeight, cargoWeight: cargoWeight)
        let grossWeight = weightBalance.calculateGrossWeight(zeroFuelWeight: zeroFuelWeight, totalFuelWeight: totalFuel)
        
        //Calculate total aircraft moment:
        let totalMoment = weightBalance.calculateMoment(pilotWeight: Double(pilotWeight.text!)!, coPilotWeight: Double(coPilotWeight.text!)!, feWeight: Double(feWeight.text!)!, fsoWeight: Double(fsoWeight.text!)!, portFwdObs: Double(portFwdObserverWeight.text!)!,stbFwdObs: Double(stbFwdObserverWeight.text!)!, tfo1Weight: Double(tfo1Weight.text!)!, tfo2Weight: Double(tfo2Weight.text!)!, tfo3Weight: Double(tfo3Weight.text!)!, tfo4Weight: Double(tfo4Weight.text!)!, firstClassWeight: Double(firstClassWeight.text!)!, portAftObsWeight: Double(portAftObserverWeight.text!)!, stbAftObsWeight: Double(stbAftObserverWeight.text!)!, galleyWeight: Double(galleyWeight.text!)!, bunkWeight: Double(bunkWeight.text!)!, aftFirstClassWeight: Double(aftFirstClassWeight.text!)!, cargoBWeight: Double(cargoBWeight.text!)!, cargoCWeight: Double(cargoCWeight.text!)!, cargoDWeight: Double(cargoDWeight.text!)!, cargoEWeight: Double(cargoEWeight.text!)!, cargoFWeight: Double(cargoFWeight.text!)!, cargoGWeight: Double(cargoGWeight.text!)!, tank14Weight: Double(tanks1and4Weight.text!)!, tank23Weight: Double(tanks2and3Weight.text!)!, tank5Weight: Double(tank5Weight.text!)!, bombBayWeight: Double(bombBayWeight.text!)!, aircraftMoment: aircraftMoment)
        
        //Calculate aircraft Center of Gravity:
        let centerOfGravity = weightBalance.calculateCenterOfGravity(totalMoment: totalMoment, grossWeight: Double(grossWeight))
        
        //Assign values to VC labels:
        ZFWLabel.text = String(zeroFuelWeight)
        grossWeightLabel.text = String(grossWeight)
        cgLabel.text = String(centerOfGravity)
        
        //Global variables:
        let roundedGW = ((Double(grossWeightLabel.text!)!/100).rounded())/10
        globalGW = String(grossWeight)
        globalRoundedGrossWeight = String(roundedGW)
        globalBasicWeight = String(basicWeight)
        
        let roundedZFW = ((Double(ZFWLabel.text!)!/100).rounded())/10
        globalRoundedZFW = String(roundedZFW)
        globalZFW = String(zeroFuelWeight)
        globalCG = String(centerOfGravity)
        globalPilotWeight = pilotWeight.text!
        globalCoPilotWeight = coPilotWeight.text!
        globalFEWeight = feWeight.text!
        globalPortFwdObsWeight = portFwdObserverWeight.text!
        globalStbFwdObsWeight = stbFwdObserverWeight.text!
        globalFwdCargoWeight = fwdCargoWeight.text!
        globalTfo1weight =  tfo1Weight.text!
        globalTfo2weight = tfo2Weight.text!
        globalTfo3weight = tfo3Weight.text!
        globalTfo4Weight = tfo4Weight.text!
        globalFirstClassWeight = firstClassWeight.text!
        globalAftFirstClassWeight = aftFirstClassWeight.text!
        globalPortAftObsWeight = portAftObserverWeight.text!
        globalStbAftObsWeight = stbAftObserverWeight.text!
        globalGalleyWeight = galleyWeight.text!
        globalBunkWeight = bunkWeight.text!
        globalCargoBweight = cargoBWeight.text!
        globalCargoCweight = cargoCWeight.text!
        globalCargoDweight = cargoDWeight.text!
        globalCargoEweight = cargoEWeight.text!
        globalCargoFweight = cargoFWeight.text!
        globalCargoGweight = cargoGWeight.text!
        globalBombBayWeight = bombBayWeight.text!
        globalTank1and4weight = tanks1and4Weight.text!
        globalTank2and3weight = tanks2and3Weight.text!
        globaltank5Weight = tank5Weight.text!
        globalAftFirstClassWeight = aftFirstClassWeight.text!
    }
    
    //close view controller with "close" button
    @IBAction func dismissVC(_ sender: DesignableButton) {
        //Dismiss THIS view controller
        self.dismiss(animated: true, completion: nil)
        
        //Dismiss the previous popover view controller when tap the close button
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}

