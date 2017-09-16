
//
//  OnStationMode;.swift
//  Master_Flight_App
//
//  Created by Gregory Boyd on 9/14/17.
//  Copyright © 2017 Gregory Boyd. All rights reserved.
//

import Foundation

struct OnStationMode {
    
    func calculateOnSta(totalFuel: Double, onStationFuelFlow: Int, returnFuelFlow: Int, destDistance: Int, groundSpeed: Int, onTopFuel: Double ) -> (onStationTime: Double, goHomeFuel: Double) {
        
        /*
         Need to convert all input number to thousands befor the math calculations
         */
        //code for calculations
        let flyHomeFuel = (destDistance/groundSpeed) * returnFuelFlow
        let onStationFuel = totalFuel - onTopFuel - flyHomeFuel
        let onStationTime = totalFuel/onStationFuelFlow
        
    }
}
