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
    
    mutating func calcMissionData(zfw:Double, totalFuel:Double, altitude:Double) ->  (stringMaxRange:String, stringLoiterSpeed:String) {
        grossWeight = zfw + totalFuel
        
        let loiterSpeed = Int(grossWeight + 90.0)
        let maxRange = Int((grossWeight * 0.5) + 205 - altitude)
        
        //Convert values to string for output to labels
        let stringMaxRange = String(maxRange)
        let stringLoiterSpeed = String(loiterSpeed)
        
        return(stringMaxRange, stringLoiterSpeed)
    }

}
