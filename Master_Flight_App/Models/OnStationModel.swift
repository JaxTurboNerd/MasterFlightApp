
//
//  OnStationMode;.swift
//  Master_Flight_App
//
//  Created by Gregory Boyd on 9/14/17.
//  Copyright © 2017 Gregory Boyd. All rights reserved.
//

import Foundation

struct OnStation {
    
    func calculateOnSta(totalFuel: Double, onStationFuelFlow: Double, returnFuelFlow: Int, destDistance: Double, groundSpeed: Double, onTopFuel: Double ) -> (onStationTime: String, departFuel: String) {
        
        //Catch zero based division errors:
         if groundSpeed == 000 || onStationFuelFlow == 0000 {
           return("Error", "Error")
         }
         else {
        
        //code for calculations
        let flyHomeFuel = Int((destDistance/groundSpeed) * Double(returnFuelFlow))
        let onStationFuel = Double(Int(totalFuel * 1000) - (Int(onTopFuel * 1000)) - flyHomeFuel)
        let onStationTime = (round(onStationFuel/onStationFuelFlow * 10)/10)
        let departFuel = flyHomeFuel + Int(onTopFuel * 1000)

        return(String(onStationTime), String(departFuel))
        }
    }
}
