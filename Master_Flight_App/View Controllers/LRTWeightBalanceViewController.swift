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
    var moment = 0.0
    var index = 0.0
    var arm = 0.0
    
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
    var aircraftWBList = ["N403SK": [64692.1, 61.0, 37311.6, 576.8],
                          "N480SK": [64577.0, 60.6, 37230.8, 576.5],
                          "N741SK": [64692.1, 61.0, 37311.6, 576.8],
                          "N144CS": [71950.5, 81.8, 42250.9, 587.2],
                          "N145CS": [72479.9, 76.8, 42416.9, 585.2],
                          "N146CS": [72279.8, 78.1, 42335.9, 585.7],
                          "N149CS": [72506.8, 78.1, 42470.4, 585.7]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
            aircraftNumberLabel.text = selectedAircraft
        
        switch selectedAircraft {
        case "N403SK":
             basicWeight = aircraftWBList[selectedAircraft]![0]
             index = aircraftWBList[selectedAircraft]![1]
             moment = aircraftWBList[selectedAircraft]![2]
             arm = aircraftWBList[selectedAircraft]![3]
            
        case "N480SK":
            basicWeight = aircraftWBList[selectedAircraft]![0]
            index = aircraftWBList[selectedAircraft]![1]
            moment = aircraftWBList[selectedAircraft]![2]
            arm = aircraftWBList[selectedAircraft]![3]
        
        case "N741SK":
            basicWeight = aircraftWBList[selectedAircraft]![0]
            index = aircraftWBList[selectedAircraft]![1]
            moment = aircraftWBList[selectedAircraft]![2]
            arm = aircraftWBList[selectedAircraft]![3]
            
        case "N144CS":
            basicWeight = aircraftWBList[selectedAircraft]![0]
            index = aircraftWBList[selectedAircraft]![1]
            moment = aircraftWBList[selectedAircraft]![2]
            arm = aircraftWBList[selectedAircraft]![3]
            
        case "N145CS":
            basicWeight = aircraftWBList[selectedAircraft]![0]
            index = aircraftWBList[selectedAircraft]![1]
            moment = aircraftWBList[selectedAircraft]![2]
            arm = aircraftWBList[selectedAircraft]![3]
            
        case "N146CS":
            basicWeight = aircraftWBList[selectedAircraft]![0]
            index = aircraftWBList[selectedAircraft]![1]
            moment = aircraftWBList[selectedAircraft]![2]
            arm = aircraftWBList[selectedAircraft]![3]
            
        case "N149CS":
            basicWeight = aircraftWBList[selectedAircraft]![0]
            index = aircraftWBList[selectedAircraft]![1]
            moment = aircraftWBList[selectedAircraft]![2]
            arm = aircraftWBList[selectedAircraft]![3]
            
        default:
            break
        }
        
        //dismiss keyboard by tapping anywhere
        self.view.addGestureRecognizer(UITapGestureRecognizer(target:
            self.view, action: #selector(UIView.endEditing(_:))))
    }
    
    @IBAction func calculateWeightBalance(_ sender: DesignableButton) {
        //create instance variable:
        let weightBalance = LRTWeightBalance()
        let totalFuel = weightBalance.calculateTotalFuel(tank1and4: Double(tanks1and4Weight.text!)!, tank2and3: Double(tanks2and3Weight.text!)!, tank5: Double(tank5Weight.text!)!).totalFuelWeight
        let flightStationWeight = weightBalance.calculateFlightStationWeight(pilot: Double(pilotWeight.text!)!, copilot: Double(coPilotWeight.text!)!, flightEngineer: Double(feWeight.text!)!, flightObserver: Double(fsoWeight.text!)!).flightStationWeight
        let tubeWeight = weightBalance.calculateTubeWeight(portFwd: Double(portFwdObserverWeight.text!)!, stbFwd: Double(stbFwdObserverWeight.text!)!, tfo1: Double(tfo1Weight.text!)!, tfo2: Double(tfo2Weight.text!)!, tfo3: Double(tfo3Weight.text!)!, tfo4: Double(tfo4Weight.text!)!, firstClass: Double(firstClassWeight.text!)!, portAft: Double(portAftObserverWeight.text!)!, stbAft: Double(stbAftObserverWeight.text!)!, galley: Double(galleyWeight.text!)!, bunk: Double(bunkWeight.text!)!).tubeWeight
        let cargoWeight = weightBalance.calculateCargoWeight(cargoB: Double(cargoBWeight.text!)!, cargoC: Double(cargoCWeight.text!)!, cargoD: Double(cargoDWeight.text!)!, cargoE: Double(cargoEWeight.text!)!, cargoF: Double(cargoFWeight.text!)!, cargoG: Double(cargoGWeight.text!)!, bombBay: Double(bombBayWeight.text!)!, aftFirstClass: Double(aftFirstClassWeight.text!)!).cargoWeight
        let zeroFuelWeight = weightBalance.calculateZFW(basicWeight: basicWeight, flightStationWeight: flightStationWeight, tubeWeight: tubeWeight, cargoWeight: cargoWeight).zeroFuelWeight
        let grossWeight = weightBalance.calculateGrossWeight(zeroFuelWeight: zeroFuelWeight, totalFuelWeight: totalFuel).grossWeight
        
        //Assign value to VC labels:
        basicWeightLabel.text = String(basicWeight)
        ZFWLabel.text = String(zeroFuelWeight)
        grossWeightLabel.text = String(grossWeight)
    }
    
    
    //close view controller with "close" button
    @IBAction func dismissVC(_ sender: DesignableButton) {
        //Dismiss THIS view controller
        self.dismiss(animated: true, completion: nil)
        
        //Dismiss the previous popover view controller when hit the close button
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}

