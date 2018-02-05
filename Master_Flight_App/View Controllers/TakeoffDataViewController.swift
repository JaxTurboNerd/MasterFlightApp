//
//  TakeoffDataViewController.swift
//  Master_Flight_App
//
//  Created by Gregory Boyd on 10/18/17.
//  Copyright © 2017 Gregory Boyd. All rights reserved.
//
import Foundation
import UIKit

// Define Global variables
var isAntiIceOn: Bool = false
var globalZFW: String = ""
var selectedTIT:String?
var globalCG: String = ""
var globalGW: String = ""
var globalRunway: String = ""
var globalWindDirection: String = ""
var globalWindSpeed: String = ""
var globalTemp: String = ""
var globalPressureAlt: String = ""
var globalSHP100: String = ""
var globalSHP95: String = ""
var globalVr: String = ""
var globalVro: String = ""
var globalVlof: String = ""
var globalV50three: String = ""
var globalV50four: String = ""
var globalRotateDistance: String = ""
var globalLOFDistance: String = ""
var globalAircraftType: String = "LRT"
var global3ROC: String = ""

//Wind Component global variables:
var globalCrossWindComponent: Double = 0.0
var globalHeadWindComponent: Double = 0.0

//View Controller Class:
class TakeoffDataViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var aircraftType = "LRT"

    @IBOutlet weak var centerOfGravity: UITextField!
    @IBOutlet weak var zeroFuelWeight: UITextField!
    @IBOutlet weak var grossWeight: UITextField!
    @IBOutlet weak var runway: UITextField!
    @IBOutlet weak var windDirection: UITextField!
    @IBOutlet weak var windSpeed: UITextField!
    @IBOutlet weak var OAT: UITextField!
    @IBOutlet weak var PA: UITextField!
    
    @IBOutlet weak var SHP100: UILabel!
    @IBOutlet weak var SHP95: UILabel!
    @IBOutlet weak var Vr: UILabel!
    @IBOutlet weak var Vro: UILabel!
    @IBOutlet weak var Vlof: UILabel!
    @IBOutlet weak var V50three: UILabel!
    @IBOutlet weak var V50four: UILabel!
    @IBOutlet weak var rotateDistance: UILabel!
    @IBOutlet weak var LOFDistance: UILabel!
    @IBOutlet weak var threeEngineROC: UILabel!
    
    @IBAction func calculatePower(_ sender: CustomButton) {
        //Create Instance Variables:
        var powerCalculation = TOPower()
        var rotateSpeed = CalculateVroSpeed()
        var liftOffSpeed = CalculateLiftOffSpeed()
        var V50fourSpeed = CalculateV50four()
        var V50threeSpeed = CalculateV50three()
        var takeoffDistance = CalculateFourEngineAccelDistance()
        var windComponents = WindComponent()
        var threeROC = ThreeROC()
        
        //Check text fields for nil and out of range values:
        checkCG(textField: centerOfGravity)
        checkZFW(textField: zeroFuelWeight)
        checkGrossWeight(textField: grossWeight)
        checkRunway(textField: runway)
        checkWindDirection(textField: windDirection)
        checkWindSpeed(textField: windSpeed)
        checkOAT(textField: OAT)
        checkPA(textField: PA)
        
        
        //Assign global values:
        globalCG = centerOfGravity.text!
        globalZFW = zeroFuelWeight.text!
        globalGW = grossWeight.text!
        globalRunway = runway.text!
        globalWindDirection = windDirection.text!
        globalWindSpeed = windSpeed.text!
        globalTemp = OAT.text!
        globalPressureAlt = PA.text!
        globalVr = Vro.text!
        globalVro = Vro.text!
        globalVlof = Vlof.text!
        globalV50three = V50three.text!
        globalZFW = zeroFuelWeight.text!
        
        //Assign values to labels from calculations
        SHP100.text = powerCalculation.calculatePower(pickerData: selectedTIT!, airTemp: Int(OAT.text!)!, isAntiIceOn: isAntiIceOn, pressureAltitude: Int(PA.text!)!).stringSHP100
        globalSHP100 = SHP100.text!
        SHP95.text = powerCalculation.calculatePower(pickerData: selectedTIT!, airTemp: Int(OAT.text!)!, isAntiIceOn: isAntiIceOn, pressureAltitude: Int(PA.text!)!).stringSHP95
        globalSHP95 = SHP95.text!
        
        Vro.text = String(Int(rotateSpeed.RotateSpeed(grossWeight: Double(grossWeight.text!)!, aircraftType: aircraftType)))
        Vlof.text = String(Int(liftOffSpeed.LiftOffSpeed(grossWeight: Double(grossWeight.text!)!, aircraftType: aircraftType)))
        V50three.text = String(Int(V50threeSpeed.V50three(grossWeight: Double(grossWeight.text!)!, aircraftType: aircraftType)))
        Vr.text = Vro.text
        threeEngineROC.text = String(threeROC.Calculate3ROC(GW: Double(grossWeight.text!)!, OAT: Int(OAT.text!)!))
        
        
        //Wind Components:
        globalHeadWindComponent = windComponents.CalculateWinds(runway: Int(runway.text!)!, windDirection: Int(windDirection.text!)!, windVelocity: Int(windSpeed.text!)!).headWind
      
        globalCrossWindComponent = windComponents.CalculateWinds(runway: Int(runway.text!)!, windDirection: Int(windDirection.text!)!, windVelocity: Int(windSpeed.text!)!).xWind
        
        if aircraftType == "AEW" {
            V50four.text = "N/A"
        }
        else {
            V50four.text = String(Int(V50fourSpeed.V50four(grossWeight: Double(grossWeight.text!)!, aircraftType: aircraftType)))
        }
        globalV50four = V50four.text!
        
        //Distances
        rotateDistance.text = "\(String(Int(takeoffDistance.AccelDistance(grossWeight: Double(grossWeight.text!)!, SHP: Double(SHP100.text!)!, pressAltitude: Double(PA.text!)!, airTemp: Double(OAT.text!)!, speed: Double(Vro.text!)!)))) ft"
        LOFDistance.text = "\(String(Int(takeoffDistance.AccelDistance(grossWeight: Double(grossWeight.text!)!, SHP: Double(SHP100.text!)!, pressAltitude: Double(PA.text!)!, airTemp: Double(OAT.text!)!, speed: Double(Vlof.text!)!)))) ft"
        
        globalRotateDistance = rotateDistance.text!
        globalLOFDistance = LOFDistance.text!
        
        //Three ROC:
        global3ROC = "\(String(threeROC.Calculate3ROC(GW: Double(grossWeight.text!)!, OAT: Int(OAT.text!)!))) fpm"
        
        //dismiss keyboard after clicking the calculate button
        self.doneClicked()
    }
    
    //Segmented Controls:
    @IBAction func EngineAntiIce(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {isAntiIceOn = true}
        else {isAntiIceOn = false}
    }
    
    @IBAction func AircraftType(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            globalAircraftType = "LRT"
            aircraftType = "LRT"
        }
        else {
            globalAircraftType = "AEW"
            aircraftType = "AEW"
        }
    }
    
    //Picker View:
    @IBOutlet weak var TIT_Picker: UIPickerView!
    var TIT_PickerData: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TIT Pickerview Data:
        TIT_PickerData = ["1077", "1010", "950"]
        
        //Add Done Button to top of keypad
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        //pushes the done button to the right side of the toolbar
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        //adds done button to a toolbar above the keypad
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(self.doneClicked))
        
        let minusButton = UIBarButtonItem(title: "—",style: .plain, target: self, action: #selector(toggleMinus))
        
        toolBar.setItems([minusButton, flexibleSpace, doneButton], animated: false)
        
        centerOfGravity.inputAccessoryView = toolBar
        OAT.inputAccessoryView = toolBar
        grossWeight.inputAccessoryView = toolBar
        PA.inputAccessoryView = toolBar
        zeroFuelWeight.inputAccessoryView = toolBar
        runway.inputAccessoryView = toolBar
        windSpeed.inputAccessoryView = toolBar
        windDirection.inputAccessoryView = toolBar
        
        //dismiss keyboard by tapping anywhere
        self.view.addGestureRecognizer(UITapGestureRecognizer(target:
            self.view, action: #selector(UIView.endEditing(_:))))
        
    }
    
    @objc func doneClicked() {
        view.endEditing(true)
    }
    
    @objc func toggleMinus(){
        if var text = OAT.text, text.isEmpty == false {
            text = "-\(text)"
            OAT.text = text
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Data Sources
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return TIT_PickerData.count
        }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return pickerView.frame.height/2.5
    }
    //MARK: Delegates
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var pickerLabel: UILabel? = (view as? UILabel)
        if pickerLabel == nil {
            pickerLabel = UILabel()
            //Background color:
            let hue = CGFloat(row)/CGFloat(TIT_PickerData.count)
            pickerLabel?.backgroundColor = UIColor(hue: hue, saturation: 1.0, brightness: 1.0, alpha: 0.6)
            pickerLabel?.font = UIFont(name: "Times New Roman", size: (pickerView.frame.height)/2.6)
            pickerLabel?.textAlignment = .center
        }
        pickerLabel?.text = TIT_PickerData[row]
        pickerLabel?.textColor = UIColor.black
        selectedTIT = TIT_PickerData[row]
        
        return pickerLabel!
    }
}

