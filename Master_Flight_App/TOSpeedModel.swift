//
//  TOSpeedModel.swift
//  Master_Flight_App
//
//  Created by Gregory Boyd on 10/3/17.
//  Copyright © 2017 Gregory Boyd. All rights reserved.
//

import Foundation

struct CalculateRotateSpeed {
    var Vro = 0.0
    mutating func RotateSpeed(grossWeight: Double, aircraftType: String)-> Double {
        if aircraftType == "LRT" {
            if grossWeight <= 114.0 {
                Vro = round(0.588 * grossWeight + 51.6)
                if Vro < 115.0 {Vro = 115.0}
            }
            else {
                Vro = round(0.588 * grossWeight + 52.2)
                if Vro < 115.0 {Vro = 115.0}
            }
        }
        else if aircraftType == "AEW" {
            
        }
        return Vro
    }
}

struct CalculateLiftOffSpeed {
    var Vlof = 0.0
    mutating func LiftOffSpeed(grossWeight: Double, aircraftType: String) -> Double {
        if aircraftType == "LRT" {
             Vlof = round(0.55 * grossWeight + 61.6)
            if Vlof < 121 {Vlof = 121.0}
         }
        else if aircraftType == "AEW" {
 
        }
        
       return Vlof
    }
}
