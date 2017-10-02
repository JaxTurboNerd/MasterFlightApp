//
//  TakeoffPowerModel.swift
//  Master_Flight_App
//
//  Created by Gregory Boyd on 8/18/17.
//  Copyright © 2017 Gregory Boyd. All rights reserved.
//

import Foundation

struct TakeoffPower {
    
    //SHP array
    let SHP1077List  = [4600, 4560, 4530, 4490, 4450, 4420, 4390, 4360, 4320, 4290, 4260, 4220, 4185, 4150, 4120, 4080, 4040,
                        4010, 3970, 3940, 3910, 3870, 3840, 3810, 3770, 3740, 3700, 3660, 3630]
    
    let SHP1010List = [4600, 4560, 4525, 4500, 4465, 4435, 4400, 4380, 4355, 4320, 4290, 4260, 4220, 4195, 4160, 4130, 4100, 4080, 4040,
                       4010, 3980, 3950, 3910, 3880, 3850, 3820, 3790, 3760, 3730, 3700, 3665, 3640, 3610, 3580, 3545, 3510, 3480, 3440,
                       3410, 3380, 3360, 3330, 3300, 3260, 3230, 3200, 3160, 3130]
    
    mutating func calculatePower(picker: String, airTemp: Int, antiIce: Bool, pressureAltitude: Int) -> (stringSHP100:String, stringSHP95: String) {
        var pressureCorrection:Int = 0
        var SHP100:Int = 0
        var SHP95: Double = 0.0
        
        //Adjusts for use of Engine Anti-ice
        var workingOAT = airTemp
        if antiIce == true {
            workingOAT = workingOAT + 13
        }
        
        // Pressure Altitude correction
        
        if pressureAltitude >= 100 {
            pressureCorrection = 12*(pressureAltitude/100)
        }
        else {
            pressureCorrection = 0
        }
        
        // Code for determining which picker data was selected goes here:
        if picker == "1077" {
            if workingOAT > 45 {
                workingOAT = 45
            }
            else if workingOAT < 17 {
                workingOAT =  17
            }
            SHP100 = SHP1077List[workingOAT - 17] - pressureCorrection
        }
        else if picker == "1010" {
            if workingOAT > 45 {
                workingOAT = 45
            }
            else if workingOAT < -2 {
                workingOAT = -2
            }
            SHP100 = SHP1010List[workingOAT + 2] - pressureCorrection
        }
        
        /*else if picker == "3500SHP" {
         }
        else if picker == "3000SHP" {
         }
         
        */
        //95% SHP Calculations
        SHP95 = Double(SHP100) * 0.95
        
        //Convert final SHP to type String
        let stringSHP100 = String(SHP100)
        let stringSHP95 = String(Int(SHP95))
        
        return (stringSHP100, stringSHP95)
    }
    
}
