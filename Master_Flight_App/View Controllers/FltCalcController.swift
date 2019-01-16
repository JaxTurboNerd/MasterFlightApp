//
//  FlightCalculatorViewController.swift
//  FlightTimeNew
//
//  Created by Gregory Boyd on 7/19/17.
//  Copyright © 2017 Gregory Boyd. All rights reserved.
//

import UIKit

class FltCalcViewController: UIViewController {
    
    @IBOutlet weak var inputTime: UITextField!
    
    @IBOutlet weak var pic1Label: UILabel!
    @IBOutlet weak var pic2Label: UILabel!
    @IBOutlet weak var pic3Label: UILabel!
    @IBOutlet weak var sic1Label: UILabel!
    @IBOutlet weak var sic2Label: UILabel!
    @IBOutlet weak var sic3Label: UILabel!
    @IBOutlet weak var crew1Label: UILabel!
    @IBOutlet weak var crew2Label: UILabel!
    @IBOutlet weak var crew3Label: UILabel!
    
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
        
        inputTime.inputAccessoryView = toolBar
        
        //dismiss keyboard by tapping anywhere
        self.view.addGestureRecognizer(UITapGestureRecognizer(target:
            self.view, action: #selector(UIView.endEditing(_:))))
        }
    
    @objc func doneClicked() {
    view.endEditing(true)
    }
    
    @IBAction func calculateTime(_ sender: UIButton) {
        
        //Catch empty flight time field
        if inputTime.text?.isEmpty == true {
            emptyAlert(alertTitle: "Flight Time Not Entered", alertMessage: "Enter flight time")
            inputTime.text = "0.0"
        }
        let flightCalculation = FlightTime()
        
        //Assign values to outlet labels
        pic1Label.text = flightCalculation.calculateFlightTime(flightTime: Double(inputTime.text!)!).time1
        pic2Label.text = flightCalculation.calculateFlightTime(flightTime: Double(inputTime.text!)!).time2
        pic3Label.text = flightCalculation.calculateFlightTime(flightTime: Double(inputTime.text!)!).time3
        sic1Label.text = flightCalculation.calculateFlightTime(flightTime: Double(inputTime.text!)!).time2
        sic2Label.text = flightCalculation.calculateFlightTime(flightTime: Double(inputTime.text!)!).time3
        sic3Label.text = flightCalculation.calculateFlightTime(flightTime: Double(inputTime.text!)!).time1
        crew1Label.text = flightCalculation.calculateFlightTime(flightTime: Double(inputTime.text!)!).time3
        crew2Label.text = flightCalculation.calculateFlightTime(flightTime: Double(inputTime.text!)!).time1
        crew3Label.text = flightCalculation.calculateFlightTime(flightTime: Double(inputTime.text!)!).time2
        
        //Dismisses keyboard after click on Calculate button
        self.doneClicked()
    }
    
    
}
