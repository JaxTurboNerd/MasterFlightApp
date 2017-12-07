//
//  OnstationViewController.swift
//  Master_Flight_App
//
//  Created by Gregory Boyd on 9/5/17.
//  Copyright © 2017 Gregory Boyd. All rights reserved.
//

import UIKit

class OnstationViewController: UIViewController {

    @IBOutlet weak var TotalFuel: UITextField!
    @IBOutlet weak var onstaFuelFLow: UITextField!
    @IBOutlet weak var returnFuelFlow: UITextField!
    @IBOutlet weak var DestDistance: UITextField!
    @IBOutlet weak var GroundSpeed: UITextField!
    @IBOutlet weak var OnTop: UITextField!
    
    @IBOutlet weak var OnStationTime: UILabel!
    @IBOutlet weak var goHomeFuel: UILabel!
    
    
    @IBAction func calcOnStation(_ sender: UIButton) {
        let OnStationCalculation = OnStation()
        
        //Catch empty fields
        if TotalFuel.text?.isEmpty == true {
            emptyAlert(alertTitle: "Fuel Totalizer not entered", alertMessage: "Enter Fuel Totalizer amount")
            TotalFuel.text = "00.0"
        }
        
        if onstaFuelFLow.text?.isEmpty == true {
            emptyAlert(alertTitle: "Onstation Fuel Flow not entered", alertMessage: "Enter Onstation Fuel Flow")
            onstaFuelFLow.text = "0000"
        }
        
        if returnFuelFlow.text?.isEmpty == true {
            emptyAlert(alertTitle: "Return fuel flow not entered", alertMessage: "Enter return fuel flow")
            returnFuelFlow.text = "0000"
        }
        if DestDistance.text?.isEmpty == true {
            emptyAlert(alertTitle: "Distance not entered", alertMessage: "Enter distance to destination")
            DestDistance.text = "0000"
        }
        if GroundSpeed.text?.isEmpty == true {
            emptyAlert(alertTitle: "Ground speed not entered", alertMessage: "Enter ground speed")
            GroundSpeed.text = "000"
        }
        if OnTop.text?.isEmpty == true {
            emptyAlert(alertTitle: "On Top Fuel not entered", alertMessage: "Enter On Top Fuel requirement")
            OnTop.text = "00.0"
        }
        
        OnStationTime.text = "\(OnStationCalculation.calculateOnSta(totalFuel: Double(TotalFuel.text!)!, onStationFuelFlow: Double(onstaFuelFLow.text!)!, returnFuelFlow: Int(returnFuelFlow.text!)!, destDistance: Double(DestDistance.text!)!, groundSpeed: Double(GroundSpeed.text!)!, onTopFuel: Double(OnTop.text!)!).stringOnStationTime) hrs"
        
        goHomeFuel.text = "\(OnStationCalculation.calculateOnSta(totalFuel: Double(TotalFuel.text!)!, onStationFuelFlow: Double(onstaFuelFLow.text!)!, returnFuelFlow: Int(returnFuelFlow.text!)!, destDistance: Double(DestDistance.text!)!, groundSpeed: Double(GroundSpeed.text!)!, onTopFuel: Double(OnTop.text!)!).stringDepartFuel) lbs"
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
        
        TotalFuel.inputAccessoryView = toolBar
        onstaFuelFLow.inputAccessoryView = toolBar
        returnFuelFlow.inputAccessoryView = toolBar
        DestDistance.inputAccessoryView = toolBar
        GroundSpeed.inputAccessoryView = toolBar
        OnTop.inputAccessoryView = toolBar
        
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
