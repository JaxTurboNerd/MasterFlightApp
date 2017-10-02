//
//  TakeoffPowerViewController.swift
//  Master_Flight_App
//
//  Created by Gregory Boyd on 8/11/17.
//  Copyright © 2017 Gregory Boyd. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var TITlabel: UILabel!
    
    //TIT Options entered by user
    @IBOutlet weak var TIT_Picker: UIPickerView!
    var TIT_PickerData: [String] = [String]()
    
    //Set Engine Anti Ice condition
    @IBOutlet weak var AntiIceLabel: UILabel!
    var isAntiIceOn: Bool!
    
    @IBAction func engineAntiIce(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            AntiIceLabel.text = "On"
        }
        else {
            AntiIceLabel.text = "Off"
        }
    }
    
    @IBOutlet weak var SHP95: UILabel!
    @IBOutlet weak var SHP100: UILabel!
    @IBOutlet weak var OAT: UITextField!
    @IBOutlet weak var PA: UITextField!

    @IBAction func calculatePower(_ sender: UIButton) {
        //MVC code
        var powerCalculation = TakeoffPower()
        
        //catch empty text fields
        if OAT.text?.isEmpty == true {
            let oatAlert = UIAlertController(title: "OAT Not Entered!", message: "Enter OAT", preferredStyle: .alert)
            oatAlert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            self.present(oatAlert, animated: true,completion: nil)
            OAT.text = "0"
        }
        
        if PA.text?.isEmpty == true {
            PA.text = "000"
            let paAlert = UIAlertController(title: "PA Not Entered!", message: "Enter PA", preferredStyle: .alert)
            paAlert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            self.present(paAlert, animated: true,completion: nil)
            PA.text = "000"
        }
        
        //Setting Anit-Ice value
        if AntiIceLabel.text == "On" {
            isAntiIceOn = true
        }
        else {
            isAntiIceOn = false
        }
        
        //assign values to label from calculations
        SHP100.text = powerCalculation.calculatePower(picker: TITlabel.text!, airTemp: Int(OAT.text!)!, antiIce: isAntiIceOn, pressureAltitude: Int(PA.text!)!).stringSHP100
        SHP95.text = powerCalculation.calculatePower(picker: TITlabel.text!, airTemp: Int(OAT.text!)!, antiIce: isAntiIceOn, pressureAltitude: Int(PA.text!)!).stringSHP95

        //dismiss keyboard after click calculate button
        self.doneClicked()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Connect Data:
        self.TIT_Picker.delegate = self
        self.TIT_Picker.dataSource = self
        
        //TIT picker data
        TIT_PickerData = ["1077", "1010"]
        
        //Add Done Button to top of keypad
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        //pushes the done button to the right side of the toolbar
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        //adds done button to a toolbar above the keypad
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(self.doneClicked))
        
        let minusButton = UIBarButtonItem(title: "—",style: .plain, target: self, action: #selector(toggleMinus))
        
        toolBar.setItems([minusButton, flexibleSpace, doneButton], animated: false)
        
        OAT.inputAccessoryView = toolBar
        PA.inputAccessoryView = toolBar
        
        //dismiss keyboard by tapping anywhere
        self.view.addGestureRecognizer(UITapGestureRecognizer(target:
            self.view, action: #selector(UIView.endEditing(_:))))

    }
    
    func doneClicked() {
        view.endEditing(true)
    }
    
    func toggleMinus(){
        if var text = OAT.text, text.isEmpty == false {
            if text.hasPrefix("-") {
                //text.replacingOccurrences(of: "-", with: "")
            }
            else {
                text = "-\(text)"
            }
            
            OAT.text = text
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    //MARK: Data Sources
    
    func numberOfComponents(in pickerView: UIPickerView)-> Int {
        return 1
    }

    func pickerView(_: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return TIT_PickerData.count
    }
    
    //MARK: Delegates
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return TIT_PickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        TITlabel.text = TIT_PickerData[row]
    }
    
    // Dispose of any resources that can be recreated.
}

