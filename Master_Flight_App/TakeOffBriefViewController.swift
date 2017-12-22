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
    @IBOutlet weak var V50Three: UILabel!
    @IBOutlet weak var V50Four: UILabel!
    @IBOutlet weak var VroDistance: UILabel!
    @IBOutlet weak var VlofDistance: UILabel!
    @IBOutlet weak var CG: UILabel!
    @IBOutlet weak var ZFW: UILabel!
    @IBOutlet weak var GW: UILabel!
    @IBOutlet weak var OAT: UILabel!
    @IBOutlet weak var PA: UILabel!
    @IBOutlet weak var Runway: UILabel!
    @IBOutlet weak var WindDirection: UILabel!
    @IBOutlet weak var WindSpeed: UILabel!
    
    @IBOutlet weak var HeadWindLabel: UILabel!
    @IBOutlet weak var HeadWindComponent: UILabel!
    @IBOutlet weak var CrossWindComponent: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TIT.text = selectedTIT
        SHP100.text = globalSHP100
        SHP95.text = globalSHP95
        Vr.text = globalVr + " kts"
        Vro.text = globalVro + " kts"
        Vlof.text = globalVlof + " kts"
        V50Three.text = globalV50three + " kts"
        V50Four.text = globalV50four + " kts"
        VroDistance.text = globalRotateDistance
        VlofDistance.text = globalLOFDistance
        CG.text = globalCG + "%"
        ZFW.text = globalZFW + "K lbs"
        GW.text = globalGW + "K lbs"
        OAT.text = globalTemp + "℃"
        PA.text = globalPressureAlt + " ft"
        Runway.text = globalRunway
        WindDirection.text = globalWindDirection
        WindSpeed.text = globalWindSpeed + "kts"
        
        if globalHeadWindComponent.isLess(than: 0.0) {
            HeadWindLabel.textColor = UIColor.red
            HeadWindLabel.text = "Tailwind Component:"
            HeadWindComponent.text = "\(String(abs(globalHeadWindComponent))) kts"
        }
        else {
            HeadWindComponent.text = "\(String(globalHeadWindComponent)) kts"
        }
        
        CrossWindComponent.text = "\(String(globalCrossWindComponent)) kts"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
