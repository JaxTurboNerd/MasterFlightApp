//
//  TOSpeedViewController.swift
//  Master_Flight_App
//
//  Created by Gregory Boyd on 9/29/17.
//  Copyright © 2017 Gregory Boyd. All rights reserved.
//
import Foundation
import UIKit

class TOSpeedViewController: UIViewController {
    var aircraftType: String = "LRT"
    
    @IBOutlet weak var grossWeight: UITextField!
    @IBOutlet weak var Vro: UILabel!
    @IBOutlet weak var Vlof: UILabel!
    @IBOutlet weak var V50four: UILabel!
    @IBOutlet weak var V50three: UILabel!
    @IBOutlet weak var rotateDistance: UILabel!
    @IBOutlet weak var LOFDistance: UILabel!
    
    
    @IBAction func AircraftType(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            aircraftType = "LRT"
        }
        else {
            aircraftType = "AEW"
        }
    }
    @IBAction func CalculateSpeeds(_ sender: RoundedButton) {
        var rotateSpeed = CalculateRotateSpeed()
        var liftOffSpeed = CalculateLiftOffSpeed()
        var V50fourSpeed = CalculateV50four()
        var V50threeSpeed = CalculateV50three()
        var takeoffDistance = CalculateFourEngineAccelDistance()
        
        //Catch empty gross weight field
        if grossWeight.text?.isEmpty == true {
            emptyAlert(alertTitle: "Gross Weight not entered", alertMessage: "Enter Gross Weight")
            grossWeight.text = "000"
        }
        
        Vro.text = String(Int(rotateSpeed.RotateSpeed(grossWeight: Double(grossWeight.text!)!, aircraftType: aircraftType)))
        Vlof.text = String(Int(liftOffSpeed.LiftOffSpeed(grossWeight: Double(grossWeight.text!)!, aircraftType: aircraftType)))
        V50three.text = String(Int(V50threeSpeed.V50three(grossWeight: Double(grossWeight.text!)!, aircraftType: aircraftType)))
        
        if aircraftType == "AEW" {
            V50four.text = "N/A"
            }
        else {
            V50four.text = String(Int(V50fourSpeed.V50four(grossWeight: Double(grossWeight.text!)!, aircraftType: aircraftType)))
            }
    
        //Distances:
        //rotateDistance.text = "\(String(Int(takeoffDistance.AccelDistance(grossWeight: Double(grossWeight.text!)!, SHP: globalSHP!, pressAltitude: Double(globalPA!), airTemp: Double(globalOAT!), speed: Double(Vro.text!)!)))) ft"
        //LOFDistance.text = "\(String(Int(takeoffDistance.AccelDistance(grossWeight: Double(grossWeight.text!)!, SHP: globalSHP!, pressAltitude: Double(globalPA!), airTemp: Double(globalOAT!), speed: Double(Vlof.text!)!)))) ft"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Add Done Button to top of keypad
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        //pushes the done button to the right side of the toolbar
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        //adds done button to a toolbar above the keypad
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(self.doneClicked))
        
        toolBar.setItems([flexibleSpace, doneButton], animated: false)

        grossWeight.inputAccessoryView = toolBar
        
        //dismiss keyboard by tapping anywhere
        self.view.addGestureRecognizer(UITapGestureRecognizer(target:
            self.view, action: #selector(UIView.endEditing(_:))))
    }

    @objc func doneClicked() {
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
