//
//  MissionModel.swift
//  Master_Flight_App
//
//  Created by Gregory Boyd on 9/4/17.
//  Copyright © 2017 Gregory Boyd. All rights reserved.
//

import Foundation

struct MissionData {
    
    var grossWeight:Double = 0.0
    
    mutating func calculateMissionData(zfw:Double, totalFuel:Double, altitude:Double) ->  (maxRange:String, loiterSpeed:String) {
        grossWeight = zfw + totalFuel
        
        let loiterSpeed = Int(grossWeight + 90.0)
        let maxRange = Int((grossWeight * 0.5) + 205 - altitude)
        
        return(String(maxRange), String(loiterSpeed))
    }

}
