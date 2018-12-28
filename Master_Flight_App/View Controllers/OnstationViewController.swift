//
//  OnstationViewController.swift
//  Master_Flight_App
//
//  Created by Gregory Boyd on 9/5/17.
//  Copyright © 2017 Gregory Boyd. All rights reserved.
//

import UIKit

class OnstationViewController: UIViewController {

    @IBOutlet weak var totalFuel: UITextField!
    @IBOutlet weak var onstaFuelFLow: UITextField!
    @IBOutlet weak var returnFuelFlow: UITextField!
    @IBOutlet weak var destDistance: UITextField!
    @IBOutlet weak var groundSpeed: UITextField!
    @IBOutlet weak var onTop: UITextField!
    
    @IBOutlet weak var onStationTime: UILabel!
    @IBOutlet weak var goHomeFuel: UILabel!
    
    
    @IBAction func calcOnStation(_ sender: UIButton) {
        //Create Onstation Instance:
        let OnStationCalculation = OnStation()
        
        //Catch empty fields
        
        checkTotalFuel(textField: totalFuel)
        checkOnstaFuelFlow(textField: onstaFuelFLow)
        checkReturnFuelFlow(textField: returnFuelFlow)
        checkDestDistance(textField: destDistance)
        checkGroundSpeed(textField: groundSpeed)
        checkOnTop(textField: onTop)
        
        //Calculate fields:
        onStationTime.text = "\(OnStationCalculation.calculateOnSta(totalFuel: Double(totalFuel.text!)!, onStationFuelFlow: Double(onstaFuelFLow.text!)!, returnFuelFlow: Int(returnFuelFlow.text!)!, destDistance: Double(destDistance.text!)!, groundSpeed: Double(groundSpeed.text!)!, onTopFuel: Double(onTop.text!)!).stringOnStationTime) hrs"
        
        goHomeFuel.text = "\(OnStationCalculation.calculateOnSta(totalFuel: Double(totalFuel.text!)!, onStationFuelFlow: Double(onstaFuelFLow.text!)!, returnFuelFlow: Int(returnFuelFlow.text!)!, destDistance: Double(destDistance.text!)!, groundSpeed: Double(groundSpeed.text!)!, onTopFuel: Double(onTop.text!)!).stringDepartFuel) lbs"
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
        
        totalFuel.inputAccessoryView = toolBar
        onstaFuelFLow.inputAccessoryView = toolBar
        returnFuelFlow.inputAccessoryView = toolBar
        destDistance.inputAccessoryView = toolBar
        groundSpeed.inputAccessoryView = toolBar
        onTop.inputAccessoryView = toolBar
        
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
