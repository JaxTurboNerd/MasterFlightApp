//
//  MissionViewController.swift
//  Master_Flight_App
//
//  Created by Gregory Boyd on 9/4/17.
//  Copyright © 2017 Gregory Boyd. All rights reserved.
//

import UIKit

class MissionViewController: UIViewController {
    
    @IBOutlet weak var zeroFuelWeight: UITextField!
    @IBOutlet weak var TotalFuel: UITextField!
    @IBOutlet weak var Altitude: UITextField!

    @IBOutlet weak var MaxRange: UILabel!
    @IBOutlet weak var LoiterSpeed: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        zeroFuelWeight.text = globalZFW
                
        //Add Done Button to top of keypad
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        //pushes the done button to the right side of the toolbar
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        //adds done button to a toolbar above the keypad
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(self.doneClicked))
        
        toolBar.setItems([flexibleSpace, doneButton], animated: false)
        
        zeroFuelWeight.inputAccessoryView = toolBar
        TotalFuel.inputAccessoryView = toolBar
        Altitude.inputAccessoryView = toolBar
        
        //dismiss keyboard by tapping anywhere
        self.view.addGestureRecognizer(UITapGestureRecognizer(target:
            self.view, action: #selector(UIView.endEditing(_:))))
    }
    
    @objc func doneClicked() {
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Navigation
    
    @IBAction func calcMission(_ sender: UIButton) {
        var missionCalculation = MissionData()

        //Check input text field values:
        checkZFW(textField: zeroFuelWeight)
        checkTotalFuel(textField: TotalFuel)
        checkAltitude(textField: Altitude)
        
        MaxRange.text = "\(missionCalculation.calculateMissionData(zfw: Double(zeroFuelWeight.text!)!, totalFuel: Double(TotalFuel.text!)!, altitude: Double(Altitude.text!)!).stringMaxRange) kts"
        LoiterSpeed.text = "\(missionCalculation.calculateMissionData(zfw: Double(zeroFuelWeight.text!)!, totalFuel: Double(TotalFuel.text!)!, altitude: Double(Altitude.text!)!).stringLoiterSpeed) kts"

        //Dismisses keyboard after click on Calculate button
        self.doneClicked()
    }

}
