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
        onStationTime.text = "\(OnStationCalculation.calculateOnSta(totalFuel: Double(totalFuel.text!)!, onStationFuelFlow: Double(onstaFuelFLow.text!)!, returnFuelFlow: Int(returnFuelFlow.text!)!, destDistance: Double(destDistance.text!)!, groundSpeed: Double(groundSpeed.text!)!, onTopFuel: Double(onTop.text!)!).onStationTime) hrs"
        
        goHomeFuel.text = "\(OnStationCalculation.calculateOnSta(totalFuel: Double(totalFuel.text!)!, onStationFuelFlow: Double(onstaFuelFLow.text!)!, returnFuelFlow: Int(returnFuelFlow.text!)!, destDistance: Double(destDistance.text!)!, groundSpeed: Double(groundSpeed.text!)!, onTopFuel: Double(onTop.text!)!).departFuel) lbs"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
