
//
//  OnStationMode;.swift
//  Master_Flight_App
//
//  Created by Gregory Boyd on 9/14/17.
//  Copyright © 2017 Gregory Boyd. All rights reserved.
//

import Foundation

struct OnStation {
    
    func calculateOnSta(totalFuel: Double, onStationFuelFlow: Int, returnFuelFlow: Int, destDistance: Int, groundSpeed: Int, onTopFuel: Double ) -> (stringOnStationTime: String, stringDepartFuel: String) {
        
        //Need to convert all input number to thousands before the math calculations
 
        //Convert Doubles to type Int
        let IntTotalFuel = Int(totalFuel)
        let IntOnTopFuel = Int(onTopFuel)
        
        //code for calculations
        let flyHomeFuel = (destDistance/groundSpeed) * returnFuelFlow
        let onStationFuel = (IntTotalFuel * 1000) - (IntOnTopFuel * 1000) - flyHomeFuel
        let onStationTime = Double(onStationFuel/onStationFuelFlow)
        let departFuel = flyHomeFuel + (IntOnTopFuel * 1000)
        
        //convert to type String for labels
        let stringOnStationTime = String(onStationTime)
        let stringDepartFuel = String(departFuel)
        
        return(stringOnStationTime, stringDepartFuel)
    }
}
