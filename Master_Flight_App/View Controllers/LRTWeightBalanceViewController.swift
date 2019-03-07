//
//  WeightBalanceViewController.swift
//  Master_Flight_App
//
//  Created by Gregory Boyd on 12/11/18.
//  Copyright © 2018 Gregory Boyd. All rights reserved.
//

import UIKit

class LRTWeightBalanceViewController: UIViewController {
    
    var selectedAircraft = ""
    var basicWeight = 0.0
    var aircraftMoment = 0.0
    var aircraftIndex = 0.0
    var aircraftArm = 0.0
    var textFields = [AllowedCharsTextField]()
    
    //class variables to pass to other view controllers:
    var passedSelectedAircraft = ""
    var passedBasicWeight = ""
    var passedGW = ""
    var passedRoundedGrossWeight = ""
    var passedZFW = ""
    var passedRoundedZFW = ""
    var passedCG = ""
    var passedPilotWeight = ""
    var passedCoPilotWeight = ""
    var passedFEWeight = ""
    var passedFSOWeight = ""
    var passedPortFwdObsWeight = ""
    var passedStbFwdObsWeight = ""
    var passedFwdCargoWeight = ""
    var passedTfo1weight = ""
    var passedTfo2weight = ""
    var passedTfo3weight = ""
    var passedTfo4Weight = ""
    var passedFirstClassWeight = ""
    var passedPortAftObsWeight = ""
    var passedStbAftObsWeight = ""
    var passedTank1Weight = ""
    var passedTank2Weight = ""
    var passedTank3Weight = ""
    var passedTank4Weight = ""
    var passedtank5Weight = ""
    var passedCargoBweight = ""
    var passedCargoCweight = ""
    var passedCargoDweight = ""
    var passedCargoEweight = ""
    var passedCargoFweight = ""
    var passedCargoGweight = ""
    var passedBombBayWeight = ""
    var passedAftFirstClassWeight = ""
    
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
    @IBOutlet weak var tank1Weight: AllowedCharsTextField!
    @IBOutlet weak var tank2Weight: AllowedCharsTextField!
    @IBOutlet weak var tank3Weight: AllowedCharsTextField!
    @IBOutlet weak var tank4Weight: AllowedCharsTextField!
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
        
        //set the aircraft tail number label to the selected aircraft from the pop over:
        //selectedAircraft passed from WBPopoverViewController
        aircraftNumberLabel.text = selectedAircraft
        passedSelectedAircraft = selectedAircraft
        
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
    
    @IBAction func calculateWeightBalance(_ sender: DesignableButton) {
        //Check for textfield nil values (can't add a nil value):
        //Create array of textfields to loop through and check all textfields for nil:
        textFields = [pilotWeight, coPilotWeight, feWeight, fsoWeight, portFwdObserverWeight, stbFwdObserverWeight, fwdCargoWeight, tfo1Weight, tfo2Weight, tfo3Weight, tfo4Weight, firstClassWeight, portAftObserverWeight, stbAftObserverWeight, tank1Weight, tank2Weight, tank3Weight, tank4Weight, tank5Weight, cargoBWeight, cargoCWeight, cargoDWeight, cargoEWeight, cargoFWeight, cargoGWeight, bombBayWeight, aftFirstClassWeight]
        
        for field in textFields {
            if field.text?.isEmpty == true {
                field.textColor = UIColor.orange
                field.text = "000"
            }
        }
        
        //create instance variable:
        let weightBalance = LRTWeightBalance()
        
        //Calculate individual totals for addition
        let totalFuel = weightBalance.calculateTotalFuel(tank1: Int(tank1Weight.text!)!, tank2: Int(tank2Weight.text!)!, tank3: Int(tank3Weight.text!)!, tank4: Int(tank4Weight.text!)!, tank5: Int(tank5Weight.text!)!)
        let flightStationWeight = weightBalance.calculateFlightStationWeight(pilot: Int(pilotWeight.text!)!, copilot: Int(coPilotWeight.text!)!, flightEngineer: Int(feWeight.text!)!, flightObserver: Int(fsoWeight.text!)!)
        let tubeWeight = weightBalance.calculateTubeWeight(portFwd: Int(portFwdObserverWeight.text!)!, stbFwd: Int(stbFwdObserverWeight.text!)!, tfo1: Int(tfo1Weight.text!)!, tfo2: Int(tfo2Weight.text!)!, tfo3: Int(tfo3Weight.text!)!, tfo4: Int(tfo4Weight.text!)!, firstClass: Int(firstClassWeight.text!)!, portAft: Int(portAftObserverWeight.text!)!, stbAft: Int(stbAftObserverWeight.text!)!)
        let cargoWeight = weightBalance.calculateCargoWeight(cargoB: Int(cargoBWeight.text!)!, cargoC: Int(cargoCWeight.text!)!, cargoD: Int(cargoDWeight.text!)!, cargoE: Int(cargoEWeight.text!)!, cargoF: Int(cargoFWeight.text!)!, cargoG: Int(cargoGWeight.text!)!, bombBay: Int(bombBayWeight.text!)!, aftFirstClass: Int(aftFirstClassWeight.text!)!)
        let zeroFuelWeight = weightBalance.calculateZFW(basicWeight: Int(basicWeight), flightStationWeight: flightStationWeight, tubeWeight: tubeWeight, cargoWeight: cargoWeight)
        let grossWeight = weightBalance.calculateGrossWeight(zeroFuelWeight: zeroFuelWeight, totalFuelWeight: totalFuel)
        
        //Calculate total aircraft moment:
        let totalMoment = weightBalance.calculateMoment(pilotWeight: Double(pilotWeight.text!)!, coPilotWeight: Double(coPilotWeight.text!)!, feWeight: Double(feWeight.text!)!, fsoWeight: Double(fsoWeight.text!)!, portFwdObs: Double(portFwdObserverWeight.text!)!,stbFwdObs: Double(stbFwdObserverWeight.text!)!, tfo1Weight: Double(tfo1Weight.text!)!, tfo2Weight: Double(tfo2Weight.text!)!, tfo3Weight: Double(tfo3Weight.text!)!, tfo4Weight: Double(tfo4Weight.text!)!, firstClassWeight: Double(firstClassWeight.text!)!, portAftObsWeight: Double(portAftObserverWeight.text!)!, stbAftObsWeight: Double(stbAftObserverWeight.text!)!, aftFirstClassWeight: Double(aftFirstClassWeight.text!)!, cargoBWeight: Double(cargoBWeight.text!)!, cargoCWeight: Double(cargoCWeight.text!)!, cargoDWeight: Double(cargoDWeight.text!)!, cargoEWeight: Double(cargoEWeight.text!)!, cargoFWeight: Double(cargoFWeight.text!)!, cargoGWeight: Double(cargoGWeight.text!)!, tank1Weight: Double(tank1Weight.text!)!, tank2Weight: Double(tank2Weight.text!)!, tank3Weight: Double(tank3Weight.text!)!, tank4Weight: Double(tank4Weight.text!)!, tank5Weight: Double(tank5Weight.text!)!, bombBayWeight: Double(bombBayWeight.text!)!, aircraftMoment: aircraftMoment)
        
        //Calculate aircraft Center of Gravity:
        let centerOfGravity = weightBalance.calculateCenterOfGravity(totalMoment: totalMoment, grossWeight: Double(grossWeight))
        
        //Assign values to VC labels:
        ZFWLabel.text = String(zeroFuelWeight)
        grossWeightLabel.text = String(grossWeight)
        cgLabel.text = String(centerOfGravity)
        
        //Data to pass to other vc's:
        let roundedGW = ((Double(grossWeightLabel.text!)!/100).rounded())/10
        let roundedZFW = ((Double(ZFWLabel.text!)!/100).rounded())/10
        passedSelectedAircraft = selectedAircraft//check this..selectedAircraft passed from Popover VC?
        passedZFW = String(zeroFuelWeight)
        passedRoundedZFW = String(roundedZFW)
        passedGW = String(grossWeight)
        passedRoundedGrossWeight = String(roundedGW)
        passedBasicWeight = String(basicWeight)
        passedCG = String(centerOfGravity)
        passedPilotWeight = pilotWeight.text!
        passedCoPilotWeight = coPilotWeight.text!
        passedFEWeight = feWeight.text!
        passedFSOWeight = fsoWeight.text!
        passedPortFwdObsWeight = portFwdObserverWeight.text!
        passedStbFwdObsWeight = stbFwdObserverWeight.text!
        passedFwdCargoWeight = fwdCargoWeight.text!
        passedTfo1weight = tfo1Weight.text!
        passedTfo2weight = tfo2Weight.text!
        passedTfo3weight = tfo3Weight.text!
        passedTfo4Weight = tfo4Weight.text!
        passedFirstClassWeight = firstClassWeight.text!
        passedAftFirstClassWeight = aftFirstClassWeight.text!
        passedPortAftObsWeight = portAftObserverWeight.text!
        passedStbAftObsWeight = stbAftObserverWeight.text!
        passedTank1Weight = tank1Weight.text!
        passedTank2Weight = tank2Weight.text!
        passedTank3Weight = tank3Weight.text!
        passedTank4Weight = tank4Weight.text!
        passedtank5Weight = tank5Weight.text!
        passedCargoBweight = cargoBWeight.text!
        passedCargoCweight = cargoCWeight.text!
        passedCargoDweight = cargoDWeight.text!
        passedCargoEweight = cargoEWeight.text!
        passedCargoFweight = cargoFWeight.text!
        passedCargoGweight = cargoGWeight.text!
        passedBombBayWeight = bombBayWeight.text!
        passedAftFirstClassWeight = aftFirstClassWeight.text!
        
        //Notification Center Info:
        NotificationCenter.default.post(name: .computeWeightBalance, object: self)
    }
    
    //close view controller with "close" button
    @IBAction func dismissVC(_ sender: DesignableButton) {
        //Dismiss THIS view controller
        self.dismiss(animated: true, completion: nil)
        
        //Dismiss the previous popover view controller when tap the close button
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveLRTWB(_ sender: DesignableButton) {
        performSegue(withIdentifier: "SavedLRTWBViewController", sender: self)
    }
    //passed data to other view controllers:
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let savedWBVC = segue.destination as! LRTSavedWBViewController
        savedWBVC.finalSelectedAircraft = self.passedSelectedAircraft
        savedWBVC.finalBasicWeight = self.passedBasicWeight
        savedWBVC.finalGW = self.passedGW
        savedWBVC.finalZFW = self.passedZFW
        savedWBVC.finalCG = self.passedCG
        savedWBVC.finalPilotWeight = self.passedPilotWeight
        savedWBVC.finalCoPilotWeight = self.passedCoPilotWeight
        savedWBVC.finalFEWeight = self.passedFEWeight
        savedWBVC.finalFSOWeight = self.passedFSOWeight
        savedWBVC.finalPortFwdObsWeight = self.passedPortFwdObsWeight
        savedWBVC.finalStbFwdObsWeight = self.passedStbFwdObsWeight
        savedWBVC.finalFwdCargoWeight = self.passedFwdCargoWeight
        savedWBVC.finalTfo1weight = self.passedTfo1weight
        savedWBVC.finalTfo2weight = self.passedTfo2weight
        savedWBVC.finalTfo3weight = self.passedTfo3weight
        savedWBVC.finalTfo4Weight = self.passedTfo4Weight
        savedWBVC.finalFirstClassWeight = self.passedFirstClassWeight
        savedWBVC.finalAftFirstClassWeight = self.passedAftFirstClassWeight
        savedWBVC.finalPortAftObsWeight = self.passedPortAftObsWeight
        savedWBVC.finalStbAftObsWeight = self.passedStbAftObsWeight
        savedWBVC.finalBombBayWeight = self.passedBombBayWeight
        savedWBVC.finalTank1Weight = self.passedTank1Weight
        savedWBVC.finalTank2Weight = self.passedTank2Weight
        savedWBVC.finalTank3Weight = self.passedTank3Weight
        savedWBVC.finalTank4Weight = self.passedTank4Weight
        savedWBVC.finaltank5Weight = self.passedtank5Weight
        savedWBVC.finalCargoBweight = self.passedCargoBweight
        savedWBVC.finalCargoCweight = self.passedCargoCweight
        savedWBVC.finalCargoDweight = self.passedCargoDweight
        savedWBVC.finalCargoEweight = self.passedCargoEweight
        savedWBVC.finalCargoFweight = self.passedCargoFweight
        savedWBVC.finalCargoGweight = self.passedCargoGweight
    }
    
}

