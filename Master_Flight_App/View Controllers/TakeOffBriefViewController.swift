//
//  TakeOffBriefViewController.swift
//  Master_Flight_App
//
//  Created by Gregory Boyd on 11/30/17.
//  Copyright © 2017 Gregory Boyd. All rights reserved.
//

import UIKit

class TakeOffBriefViewController: UIViewController {
    
    @IBOutlet weak var TIT: UILabel!
    @IBOutlet weak var SHP100: UILabel!
    @IBOutlet weak var SHP95: UILabel!
    @IBOutlet weak var Vr: UILabel!
    @IBOutlet weak var Vro: UILabel!
    @IBOutlet weak var Vlof: UILabel!
    @IBOutlet weak var v50Three: UILabel!
    @IBOutlet weak var v50Four: UILabel!
    @IBOutlet weak var VroDistance: UILabel!
    @IBOutlet weak var VlofDistance: UILabel!
    @IBOutlet weak var cg: UILabel!
    @IBOutlet weak var zfw: UILabel!
    @IBOutlet weak var grossWeight: UILabel!
    @IBOutlet weak var outsideAirTemp: UILabel!
    @IBOutlet weak var pressAltitude: UILabel!
    @IBOutlet weak var runway: UILabel!
    @IBOutlet weak var windDirection: UILabel!
    @IBOutlet weak var windSpeed: UILabel!
    @IBOutlet weak var threeROC: UILabel!
    
    @IBOutlet weak var headWindLabel: UILabel!
    @IBOutlet weak var headWindComponent: UILabel!
    @IBOutlet weak var crossWindComponent: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch selectedTIT {
        case "1077"?, "1010"?, "950"?:
            TIT.text = selectedTIT
        case "4600"?, "3500"?:
            TIT.text = globalPredictedTIT
        default:
            break
        }
        //Set label data:
        SHP100.text = globalSHP100
        SHP95.text = globalSHP95
        Vr.text = globalVr + " kts"
        Vro.text = globalVro + " kts"
        Vlof.text = globalVlof + " kts"
        v50Three.text = globalV50three + " kts"
        v50Four.text = globalV50four + " kts"
        VroDistance.text = globalRotateDistance
        VlofDistance.text = globalLOFDistance
        cg.text = globalCG + "%"
        zfw.text = globalZFW + "K lbs"
        grossWeight.text = globalGW + "K lbs"
        outsideAirTemp.text = globalTemp + "℃"
        pressAltitude.text = globalPressureAlt + " ft"
        runway.text = globalRunway
        windDirection.text = globalWindDirection
        windSpeed.text = globalWindSpeed + "kts"
        threeROC.text = global3ROC
        
        if globalHeadWindComponent.isLess(than: 0.0) {
            headWindLabel.textColor = UIColor.red
            headWindLabel.text = "Tailwind Component:"
            headWindComponent.text = "\(String(abs(globalHeadWindComponent))) kts"
        }
        else {
            headWindComponent.text = "\(String(globalHeadWindComponent)) kts"
        }
        
        crossWindComponent.text = "\(String(globalCrossWindComponent)) kts"
        
    }
}
