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
        //Create Onstation Instance:
        let OnStationCalculation = OnStation()
        
        //Catch empty fields
        
        checkTotalFuel(textField: TotalFuel)
        checkOnstaFuelFlow(textField: onstaFuelFLow)
        checkReturnFuelFlow(textField: returnFuelFlow)
        checkDestDistance(textField: DestDistance)
        checkGroundSpeed(textField: GroundSpeed)
        checkOnTop(textField: OnTop)
        
        //Calculate fields:
        OnStationTime.text = "\(OnStationCalculation.calculateOnSta(totalFuel: Double(TotalFuel.text!)!, onStationFuelFlow: Double(onstaFuelFLow.text!)!, returnFuelFlow: Int(returnFuelFlow.text!)!, destDistance: Double(DestDistance.text!)!, groundSpeed: Double(GroundSpeed.text!)!, onTopFuel: Double(OnTop.text!)!).stringOnStationTime) hrs"
        
        goHomeFuel.text = "\(OnStationCalculation.calculateOnSta(totalFuel: Double(TotalFuel.text!)!, onStationFuelFlow: Double(onstaFuelFLow.text!)!, returnFuelFlow: Int(returnFuelFlow.text!)!, destDistance: Double(DestDistance.text!)!, groundSpeed: Double(GroundSpeed.text!)!, onTopFuel: Double(OnTop.text!)!).stringDepartFuel) lbs"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Add Done Button to top of keypad
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        //pushes the done button to the right side of the toolbar
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        
        //adds done button to a toolbar above the keypad
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(self.doneClicked))
        
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
