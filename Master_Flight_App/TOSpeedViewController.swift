//
//  TOSpeedViewController.swift
//  Master_Flight_App
//
//  Created by Gregory Boyd on 9/29/17.
//  Copyright © 2017 Gregory Boyd. All rights reserved.
//
import Foundation
import UIKit

//This adds a max length for all storyboard text fields.
private var __maxLengths = [UITextField: Int]()
extension UITextField {
    @IBInspectable var maxLength: Int {
        get {
            guard let l = __maxLengths[self] else {
                return 150 // (global default-limit. or just, Int.max)
            }
            return l
        }
        set {
            __maxLengths[self] = newValue
            addTarget(self, action: #selector(fix), for: .editingChanged)
        }
    }
    func fix(textField: UITextField) {
        let t = textField.text
        textField.text = t?.safelyLimitedTo(length: maxLength)
    }
}

extension String
{
    func safelyLimitedTo(length n: Int)->String {
        let c = self.characters
        if (c.count <= n) { return self }
        return String( Array(c).prefix(upTo: n) )
    }
}

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
        var liftOffSpeed = CalculateLiftOffSpeed()
        
        //Catch empty gross weight field
        if grossWeight.text?.isEmpty == true {
            emptyAlert(alertTitle: "Gross Weight not entered", alertMessage: "Enter Gross Weight")
            grossWeight.text = "000"
        }
        
        Vro.text = String(Int(rotateSpeed.RotateSpeed(grossWeight: Double(grossWeight.text!)!, aircraftType: aircraftType)))
        Vlof.text = String(Int(liftOffSpeed.LiftOffSpeed(grossWeight: Double(grossWeight.text!)!, aircraftType: aircraftType)))
        
        /*
         V50(3).text =
         V50(4).text =
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
