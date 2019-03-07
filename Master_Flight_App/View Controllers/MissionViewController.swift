//
//  MissionViewController.swift
//  Master_Flight_App
//
//  Created by Gregory Boyd on 9/4/17.
//  Copyright © 2017 Gregory Boyd. All rights reserved.
//

import UIKit

class MissionViewController: UIViewController {
    
    //variables for passed data from other view controllers:
    var passedZFW = ""
    
    //Outlets:
    @IBOutlet weak var zeroFuelWeight: UITextField!
    @IBOutlet weak var totalFuel: UITextField!
    @IBOutlet weak var altitude: UITextField!

    @IBOutlet weak var maxRange: UILabel!
    @IBOutlet weak var loiterSpeed: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        zeroFuelWeight.text = passedZFW
        
        //dismiss keyboard by tapping anywhere
        self.view.addGestureRecognizer(UITapGestureRecognizer(target:
            self.view, action: #selector(UIView.endEditing(_:))))
    }
    
    @objc func doneClicked() {
        view.endEditing(true)
    }

    @IBAction func calcMission(_ sender: UIButton) {
        var missionCalculation = MissionData()

        //Check input text field values:
        checkZFW(textField: zeroFuelWeight)
        checkTotalFuel(textField: totalFuel)
        checkAltitude(textField: altitude)
        
        maxRange.text = "\(missionCalculation.calculateMissionData(zfw: Double(zeroFuelWeight.text!)!, totalFuel: Double(totalFuel.text!)!, altitude: Double(altitude.text!)!).maxRange) kts"
        loiterSpeed.text = "\(missionCalculation.calculateMissionData(zfw: Double(zeroFuelWeight.text!)!, totalFuel: Double(totalFuel.text!)!, altitude: Double(altitude.text!)!).loiterSpeed) kts"

        //Dismisses keyboard after click on Calculate button
        self.doneClicked()
    }

}
