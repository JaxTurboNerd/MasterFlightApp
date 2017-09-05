//
//  MissionViewController.swift
//  Master_Flight_App
//
//  Created by Gregory Boyd on 9/4/17.
//  Copyright © 2017 Gregory Boyd. All rights reserved.
//

import UIKit

class MissionViewController: UIViewController {
    @IBOutlet weak var ZeroFuelWeight: UITextField!
    @IBOutlet weak var TotalFuel: UITextField!
    @IBOutlet weak var Altitude: UITextField!

    @IBOutlet weak var MaxRange: UILabel!
    @IBOutlet weak var LoiterSpeed: UILabel!
    
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
        
        ZeroFuelWeight.inputAccessoryView = toolBar
        TotalFuel.inputAccessoryView = toolBar
        Altitude.inputAccessoryView = toolBar
        
        //dismiss keyboard by tapping anywhere
        self.view.addGestureRecognizer(UITapGestureRecognizer(target:
            self.view, action: #selector(UIView.endEditing(_:))))
    }
    
    func doneClicked() {
        view.endEditing(true)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation
    
    @IBAction func calcMission(_ sender: UIButton) {
        var missionCalculation = MissionData()
        
        MaxRange.text = missionCalculation.calcMissionData(zfw: Double(ZeroFuelWeight.text!)!, totalFuel: Double(TotalFuel.text!)!, altitude: Double(Altitude.text!)!).stringMaxRange
        LoiterSpeed.text = missionCalculation.calcMissionData(zfw: Double(ZeroFuelWeight.text!)!, totalFuel: Double(TotalFuel.text!)!, altitude: Double(Altitude.text!)!).stringLoiterSpeed
        
        //Dismisses keyboard after click on Calculate button
        self.doneClicked()
    }

}
