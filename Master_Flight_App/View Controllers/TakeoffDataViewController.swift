//
//  TakeoffDataViewController.swift
//  Master_Flight_App
//
//  Created by Gregory Boyd on 10/18/17.
//  Copyright © 2017 Gregory Boyd. All rights reserved.
//
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
    @IBOutlet weak var outsideAirTemp: UITextField!
    @IBOutlet weak var pressureAltitude: UITextField!
    
    @IBOutlet weak var SHP100: UILabel!
    @IBOutlet weak var SHP95: UILabel!
    @IBOutlet weak var Vr: UILabel!
    @IBOutlet weak var Vro: UILabel!
    @IBOutlet weak var Vlof: UILabel!
    @IBOutlet weak var v50three: UILabel!
    @IBOutlet weak var v50four: UILabel!
    @IBOutlet weak var rotateDistance: UILabel!
    @IBOutlet weak var LOFDistance: UILabel!
    @IBOutlet weak var threeEngineROC: UILabel!
    @IBOutlet weak var setPowerLabel: UILabel!
    @IBOutlet weak var TIT_Picker: UIPickerView!
    
    @IBAction func calculatePower(_ sender: UIButton) {
        //Create Instance Variables:
        var powerCalculation = TOPower()
        var rotateSpeed = CalculateVroSpeed()
        var liftOffSpeed = CalculateLiftOffSpeed()
        var v50fourSpeed = CalculateV50four()
        var v50threeSpeed = CalculateV50three()
        var takeoffDistance = CalculateFourEngineAccelDistance()
        var windComponents = WindComponent()
        var threeROC = ThreeROC()
        
        //Checks text fields for nil and out of range values:
        checkCG(textField: centerOfGravity)
        checkZFW(textField: zeroFuelWeight)
        checkGrossWeight(textField: grossWeight)
        checkRunway(textField: runway)
        checkWindDirection(textField: windDirection)
        checkWindSpeed(textField: windSpeed)
        checkOAT(textField: outsideAirTemp)
        checkPA(textField: pressureAltitude)
        
        
        //Assign global values:
        globalCG = centerOfGravity.text!
        globalZFW = zeroFuelWeight.text!
        globalGW = grossWeight.text!
        globalRunway = runway.text!
        globalWindDirection = windDirection.text!
        globalWindSpeed = windSpeed.text!
        globalTemp = outsideAirTemp.text!
        globalPressureAlt = pressureAltitude.text!
        globalVr = Vro.text!
        globalVro = Vro.text!
        globalVlof = Vlof.text!
        globalV50three = v50three.text!
        globalZFW = zeroFuelWeight.text!
        
        //Assign values to labels from calculations
        
        //SHP:
        SHP100.text = powerCalculation.calculatePower(selectedPower: selectedTIT!, airTemp: Int(outsideAirTemp.text!)!, isAntiIceOn: isAntiIceOn, pressureAltitude: Int(pressureAltitude.text!)!).SHP100
        globalSHP100 = SHP100.text!
            
        SHP95.text = powerCalculation.calculatePower(selectedPower: selectedTIT!, airTemp: Int(outsideAirTemp.text!)!, isAntiIceOn: isAntiIceOn, pressureAltitude: Int(pressureAltitude.text!)!).SHP95
        globalSHP95 = SHP95.text!
        
        switch selectedTIT {
        case "1077"?, "1010"?, "950"?:
            setPowerLabel.text = "\(selectedTIT!) TIT"
        case "4600"?, "3500"?:
            setPowerLabel.text = "\(powerCalculation.calculatePower(selectedPower: selectedTIT!, airTemp: Int(outsideAirTemp.text!)!, isAntiIceOn: isAntiIceOn, pressureAltitude: Int(pressureAltitude.text!)!).predictedTIT) TIT"
        default:
            break
        }
        
        
        //Speeds:
        Vro.text = String(Int(rotateSpeed.rotateSpeed(grossWeight: Double(grossWeight.text!)!, aircraftType: aircraftType)))
        Vlof.text = String(Int(liftOffSpeed.liftOffSpeed(grossWeight: Double(grossWeight.text!)!, aircraftType: aircraftType)))
        v50three.text = String(Int(v50threeSpeed.V50three(grossWeight: Double(grossWeight.text!)!, aircraftType: aircraftType)))
        Vr.text = Vro.text
        threeEngineROC.text = String(threeROC.calculate3ROC(GW: Double(grossWeight.text!)!, OAT: Int(outsideAirTemp.text!)!, PA: Int(pressureAltitude.text!)!))
        
        
        //Wind Components:
        globalHeadWindComponent = windComponents.calculateWinds(runway: Int(runway.text!)!, windDirection: Int(windDirection.text!)!, windVelocity: Int(windSpeed.text!)!).headWind
      
        globalCrossWindComponent = windComponents.calculateWinds(runway: Int(runway.text!)!, windDirection: Int(windDirection.text!)!, windVelocity: Int(windSpeed.text!)!).xWind
        
        if aircraftType == "AEW" {
            v50four.text = "N/A"
        }
        else {
            v50four.text = String(Int(v50fourSpeed.V50four(grossWeight: Double(grossWeight.text!)!, aircraftType: aircraftType)))
        }
        globalV50four = v50four.text!
        
        //Distances
        rotateDistance.text = "\(String(Int(takeoffDistance.accelerationDistance(grossWeight: Double(grossWeight.text!)!, SHP: Double(SHP100.text!)!, pressAltitude: Double(pressureAltitude.text!)!, airTemp: Double(outsideAirTemp.text!)!, speed: Double(Vro.text!)!)))) ft"
        LOFDistance.text = "\(String(Int(takeoffDistance.accelerationDistance(grossWeight: Double(grossWeight.text!)!, SHP: Double(SHP100.text!)!, pressAltitude: Double(pressureAltitude.text!)!, airTemp: Double(outsideAirTemp.text!)!, speed: Double(Vlof.text!)!)))) ft"
        
        globalRotateDistance = rotateDistance.text!
        globalLOFDistance = LOFDistance.text!
        
        //Three ROC:
        global3ROC = "\(String(threeROC.calculate3ROC(GW: Double(grossWeight.text!)!, OAT: Int(outsideAirTemp.text!)!, PA: Int(pressureAltitude.text!)!))) fpm"
        
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
    
    //TIT Pickerview Data:
    let TIT_PickerData = ["1077", "1010", "950", "4600", "3500"]
    override func viewDidLoad() {
    
        super.viewDidLoad()
        //Right align textfields with decimal
        centerOfGravity.textAlignment = .right
        zeroFuelWeight.textAlignment = .right
        grossWeight.textAlignment = .right
        
        //Add Done Button to top of keypad
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        //pushes the done button to the right side of the toolbar
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        
        //adds done button to a toolbar above the keypad
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(self.doneClicked))
        
        let minusButton = UIBarButtonItem(title: "—",style: .plain, target: self, action: #selector(toggleMinus))
        
        toolBar.setItems([minusButton, flexibleSpace, doneButton], animated: false)
        
        centerOfGravity.inputAccessoryView = toolBar
        outsideAirTemp.inputAccessoryView = toolBar
        grossWeight.inputAccessoryView = toolBar
        pressureAltitude.inputAccessoryView = toolBar
        zeroFuelWeight.inputAccessoryView = toolBar
        runway.inputAccessoryView = toolBar
        windSpeed.inputAccessoryView = toolBar
        windDirection.inputAccessoryView = toolBar
        
        //dismiss keyboard by tapping anywhere
        self.view.addGestureRecognizer(UITapGestureRecognizer(target:
            self.view, action: #selector(UIView.endEditing(_:))))
    }
    
    //dismisses keyboard by touching done button on keyboard
    @objc func doneClicked() {
        view.endEditing(true)
    }
    
    @objc func toggleMinus(){
        if var text = outsideAirTemp.text, text.isEmpty == false {
            text = "-\(text)"
            outsideAirTemp.text = text
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
        return 40 //Do NOT change this number.
    }
    
    //MARK: Delegates
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var pickerLabel: UILabel? = (view as? UILabel)
        if pickerLabel == nil {
            pickerLabel = UILabel()
            //Background color:
            let hue = CGFloat(row)/CGFloat(TIT_PickerData.count)
            pickerLabel?.backgroundColor = UIColor(hue: hue, saturation: 1.0, brightness: 1.0, alpha: 0.6)
            pickerLabel?.font = UIFont(name: "Times New Roman", size: (pickerView.frame.height)/2.7)
            pickerLabel?.textAlignment = .center
        }
        pickerLabel?.text = TIT_PickerData[row]
        pickerLabel?.textColor = UIColor.black
        selectedTIT = TIT_PickerData[row]
        
        switch selectedTIT {
        case "1077"?, "1010"?, "950"?:
            setPowerLabel.text = "\(TIT_PickerData[row]) TIT"
        case "4600"?, "3500"?:
            setPowerLabel.text = "\(TIT_PickerData[row]) SHP"
        default:
            break
        }
        return pickerLabel!
    }
}

