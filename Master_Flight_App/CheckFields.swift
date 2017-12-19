//
//  CheckFields.swift
//  Master_Flight_App
//
//  Created by Gregory Boyd on 12/18/17.
//  Copyright © 2017 Gregory Boyd. All rights reserved.
//

import UIKit

extension TakeoffDataViewController {
    
    func checkCG(textField: UITextField) -> Void {
        if textField.text?.isEmpty == true {
            emptyAlert(alertTitle: "CG Not Entered", alertMessage: "Enter CG")
            centerOfGravity.text = "000"
        }
    }
    
    func checkZFW(textField: UITextField) -> Void {
        if textField.text?.isEmpty == true {
            emptyAlert(alertTitle: "ZFW Not Entered", alertMessage: "Enter ZFW")
            zeroFuelWeight.text = "000"
        }
        if globalAircraftType == "LRT" && Double(textField.text!)! > 71.6 {
            outOfRangeAlert(alertTitle: "ZFW entered NOT valid", alertMessage: "Enter ZFW")
        }
        if globalAircraftType == "AEW" && Double(textField.text!)! > 77.2 {
            outOfRangeAlert(alertTitle: "ZFW entered NOT valid", alertMessage: "Enter ZFW")
        }
    }
    
    func checkGrossWeight(textField: UITextField) -> Void {
        if textField.text?.isEmpty == true {
            emptyAlert(alertTitle: "Gross Weight not entered", alertMessage: "Enter Gross Weight")
            grossWeight.text = "000"
        }
        if aircraftType == "LRT" && (Double(textField.text!)! < 0.0 || Double(textField.text!)! > 127.5) {
            outOfRangeAlert(alertTitle: "Gross Weight Outside Normal Range", alertMessage: "Enter Gross Weight")
        }
        if aircraftType == "AEW" && (Double(textField.text!)!) < 0.0 || Double(textField.text!)! > 139.8 {
            outOfRangeAlert(alertTitle: "Gross Weight Outside Normal Range", alertMessage: "Enter Gross Weight")
        }
    }
    
    func checkRunway(textField: UITextField)-> Void {
        if textField.text?.isEmpty == true {
            emptyAlert(alertTitle: "Runway Not Entered", alertMessage: "Enter Runway in Use")
            runway.text = "36"
        }
        if Int(textField.text!)! < 1 || Int(textField.text!)! > 36 {
            outOfRangeAlert(alertTitle: "Runway entered NOT Valid", alertMessage: "Enter Runway")
        }
    }
    
    func checkWindDirection(textField: UITextField) -> Void {
        if Int(textField.text!)! < 010 || Int(textField.text!)! > 360 {
            outOfRangeAlert(alertTitle: "Wind Direction Invalid", alertMessage: "Enter Wind direction")
            
        }
    }
    
    func checkWindSpeed(textField: UITextField) -> Void {
        if windSpeed.text?.isEmpty == true {
            emptyAlert(alertTitle: "Wind Speed not Entered", alertMessage: "Enter Wind Speed")
            windSpeed.text = "00"
        }
    }
    
    func checkOAT(textField: UITextField) -> Void {
        if textField.text?.isEmpty == true {
            emptyAlert(alertTitle: "OAT Not Entered", alertMessage: "Enter OAT")
            OAT.text = "0"
        }
    }
    
    func checkPA(textField: UITextField) -> Void {
        if PA.text?.isEmpty == true {
            emptyAlert(alertTitle: "PA Not Entered", alertMessage: "Enter OAT")
            PA.text = "000"
        }
    }
}
