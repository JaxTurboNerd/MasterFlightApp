//
//  OnstationViewController.swift
//  Master_Flight_App
//
//  Created by Gregory Boyd on 9/5/17.
//  Copyright © 2017 Gregory Boyd. All rights reserved.
//

import UIKit

class OnstationViewController: UIViewController {

    @IBOutlet weak var TotalFuel: UITextField!
   
    @IBOutlet weak var DestDistance: UITextField!
    @IBOutlet weak var GroundSpeed: UITextField!
    @IBOutlet weak var OnTop: UITextField!
    @IBOutlet weak var OnStationTime: UILabel!
    
    
    @IBAction func calcOnStation(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
