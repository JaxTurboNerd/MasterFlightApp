
//
//  OnStationMode;.swift
//  Master_Flight_App
//
//  Created by Gregory Boyd on 9/14/17.
//  Copyright © 2017 Gregory Boyd. All rights reserved.
//

import Foundation

struct OnStationMode {
    
    func calculateOnSta(totalFuel: Double, onStationFuelFlow: Int, returnFuelFlow: Int, destDistance: Int, groundSpeed: Int, onTopFuel: Double ) -> (stringOnStationTime: String, stringFlyHomeFuel: String) {
        
        /*
         Need to convert all input number to thousands befor the math calculations
         */
        //code for calculations
        let flyHomeFuel = Double((destDistance/groundSpeed) * returnFuelFlow)
        let onStationFuel = totalFuel - onTopFuel - Double(flyHomeFuel)
        let onStationTime = onStationFuel/Double(onStationFuelFlow)
        
        //convert to type String for labels
        let stringOnStationTime = String(onStationTime)
        let stringFlyHomeFuel = String(flyHomeFuel)
        
        return(stringOnStationTime, stringFlyHomeFuel)
    }
}
