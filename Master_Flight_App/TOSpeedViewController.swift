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
    @IBOutlet weak var V50: UILabel!
    
    @IBAction func AircraftType(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            aircraftType = "LRT"
            sender.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.red], for: .selected)
        }
        else {
            aircraftType = "AEW"
            sender.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.red], for: .selected)
        }
    }
    @IBAction func CalculateSpeeds(_ sender: RoundedButton) {
        var rotateSpeed = CalculateRotateSpeed()
        
        Vro.text = String(Int(rotateSpeed.RotateSpeed(grossWeight: Double(grossWeight.text!)!, aircraftType: aircraftType)))
        /*
         Vlof.text =
         V50.text = 
        */
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

    func doneClicked() {
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
