//
//  TakeoffDataModel.swift
//  Master_Flight_App
//
//  Created by Gregory Boyd on 10/18/17.
//  Copyright © 2017 Gregory Boyd. All rights reserved.
//

import Foundation

struct TOPower {
    //Takeoff Power Settings:
    let SHP1077List  = [4600, 4560, 4530, 4490, 4450, 4420, 4390, 4360, 4320, 4290, 4260, 4220, 4185, 4150, 4120, 4080, 4040,
        4010, 3970, 3940, 3910, 3870, 3840, 3810, 3770, 3740, 3700, 3660, 3630]
    
    let SHP1010List = [4600, 4560, 4525, 4500, 4465, 4435, 4400, 4380, 4355, 4320, 4290, 4260, 4220, 4195, 4160, 4130, 4100, 4080, 4040, 4010, 3980, 3950, 3910, 3880, 3850, 3820, 3790, 3760, 3730, 3700, 3665, 3640, 3610, 3580, 3545, 3510, 3480, 3440,
        3410, 3380, 3360, 3330, 3300, 3260, 3230, 3200, 3160, 3130]
    
    let SHP950List = [4450, 4420, 4400, 4380, 5350, 4320, 4290, 4270, 4240, 4210, 4180, 4160, 4130, 4100, 4070, 4040, 4010, 3980, 3950, 3930, 3900, 3870, 3850, 3820, 3790, 3760, 3730, 3700, 3670, 3650, 3620, 3590, 3560, 3540, 3510, 3480, 3460, 3430, 3400, 3370, 3340, 3310, 3280, 3250, 3220, 3190, 3160, 3140, 3110, 3080, 3050, 3030, 3000, 2970, 2940, 2910, 2890, 2865, 2830, 2800, 2770, 2740, 2710, 2680]
    
    let SHP4600List = [908, 910, 913, 915, 918, 920, 923, 925, 928, 930, 932, 936, 938, 940, 943, 946, 948, 950, 953, 955, 958, 961, 964, 966, 969, 972, 975, 978, 980, 983, 986, 989, 992, 995, 998, 1001, 1006, 1008, 1010, 1014, 1017, 1020, 1024, 1027, 1030, 1033, 1035, 1040, 1046, 1049, 1052, 1056, 1059, 1063, 1066, 1069, 1073, 1077]
    
    let SHP3500List = [856, 858, 860, 863, 865, 867, 869, 872, 875, 877, 879, 881, 884, 888, 890, 892, 898, 901, 904, 906, 909, 912, 915, 917, 920, 923, 927, 930, 932, 935, 937, 941, 945, 949, 952, 956, 959, 961, 966, 970, 973, 976, 979, 983, 987, 990, 993, 996, 1001, 1006, 1010]
    
    mutating func calculatePower(pickerData: String, airTemp: Int, isAntiIceOn: Bool, pressureAltitude: Int) -> (stringSHP100:String, stringSHP95: String) {
        var pressureCorrection:Int = 0
        var SHP100 = 0
        var SHP95 = 0.0
        
        //Adjusts for use of Engine Anti-ice
        var workingOAT = airTemp
        if isAntiIceOn == true {
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
        
        if pickerData == "1077" {
            if workingOAT > 45 {workingOAT = 45}
            else if workingOAT < 17 {workingOAT =  17}
            SHP100 = SHP1077List[workingOAT - 17] - pressureCorrection
        }
        else if pickerData == "1010" {
            if workingOAT > 45 {workingOAT = 45}
            else if workingOAT < -2 {workingOAT = -2}
            SHP100 = SHP1010List[workingOAT + 2] - pressureCorrection
        }
        else if pickerData == "950" {
            if workingOAT > 45 {workingOAT = 45}
            else if workingOAT < -18 {workingOAT = -18}
            SHP100 = SHP950List[workingOAT + 18] - pressureCorrection
        }
        //case "3500":
        //case "3000":
        
        //95% SHP Calculations
        SHP95 = Double(SHP100) * 0.95
        
        //Convert final SHP to type String
        let stringSHP100 = String(SHP100)
        let stringSHP95 = String(Int(SHP95))
        
        return (stringSHP100, stringSHP95)
    }
}
struct CalculateVroSpeed {
    var Vro = 0.0
    mutating func rotateSpeed(grossWeight: Double, aircraftType: String)-> Double {
        switch aircraftType {
        case "LRT":
            if grossWeight <= 108.0 {Vro = 115.0}
            else if grossWeight > 108.0 && grossWeight <= 114.0 {
                Vro = round(0.582 * grossWeight + 52.6)
            }
            else if grossWeight > 114.0 {
                Vro = round(0.588 * grossWeight + 52.2)
            }
        case "AEW":
            if grossWeight <= 117.8 {Vro = 120}
            else {Vro = round(0.62 * grossWeight + 47.1)}
        default:
            break
        }
        return Vro
    }
}

struct CalculateLiftOffSpeed {
    var Vlof = 0.0
    mutating func liftOffSpeed(grossWeight: Double, aircraftType: String) -> Double {
        if aircraftType == "LRT" {
            if grossWeight <= 108.0 {Vlof = 121.0}
            else {Vlof = round(0.542 * grossWeight + 62.8)}
        }
        else if aircraftType == "AEW" {
            if grossWeight <= 117.5 {Vlof = 126}
            else {Vlof = round(0.6314 * grossWeight + 51.9)}
        }
        return Vlof
    }
}

struct CalculateV50four {
    var V50four = 0.0
    mutating func V50four(grossWeight: Double, aircraftType: String)-> Double {
        if aircraftType == "LRT" {
            if grossWeight <= 108.0 {V50four = round(142.5 - 0.128 * grossWeight)}
            else {V50four = round(76.2 + 0.487 * grossWeight)}
        }
        else {V50four = 000.0}
        return V50four
    }
}

struct CalculateV50three {
    var V50three = 0.0
    mutating func V50three(grossWeight: Double, aircraftType: String)-> Double {
        if aircraftType == "LRT" {
            if grossWeight <= 108.0 {V50three = 124.5}
            else {V50three = round(66.8 + 0.539 * grossWeight)}
        }
        else if aircraftType == "AEW" {
            if grossWeight <= 110.0 {V50three = 130.0}
            else {V50three = round(0.4706 * grossWeight + 78.2)}
        }
        return V50three
    }
}

struct CalculateFourEngineAccelDistance {
    mutating func accelerationDistance(grossWeight: Double, SHP: Double, pressAltitude: Double, airTemp: Double, speed: Double)-> Double {
        let pressureRatio = pow(1 - ((68758 * pow(10, -10)) * pressAltitude), 5.2557)
        let rho = pressureRatio * (288.15 / (airTemp + 273.15))
        let distance = (0.0422 - ((3 * pow(10, -8)) * (grossWeight * 1000))) * ((grossWeight * 1000) * (pow(speed, 2)/rho)) / ((4 * SHP) - (0.025 * (grossWeight * 1000)) - (0.171 - (0.000164 * (speed/pow(rho, 0.5))) * pow(speed, 2)))
        
        return distance
    }
}

struct WindComponent {
    var windAngle = 0
    var xWind = 0.0
    var headWind = 0.0
    
    mutating func calculateWinds(runway: Int, windDirection: Int, windVelocity: Int) -> (headWind: Double, xWind: Double) {
        windAngle = abs((runway*10) - windDirection)
        xWind = abs((round((sin(Double(windAngle) * Double.pi/180) * Double(windVelocity)) * 10))/10)
        headWind = (round((cos(Double(windAngle) * Double.pi/180.0) * Double(windVelocity)) * 10))/10
        
        return (headWind, xWind)
    }
}

struct ThreeROC {
    var deltaT = 0
    var threeROC = 0
    
    mutating func calculate3ROC(GW: Double, OAT: Int) -> (Int) {
        if OAT == 15 {deltaT = 0}
        else {deltaT = OAT - 15}
        
        switch deltaT {
        case 0:
            threeROC = Int((12391.51 * (pow(0.977896843, GW))) - 130)
        case 1...:
            threeROC = Int((12391.51 * (pow(0.977896843, GW))) - 130) - (deltaT * 10)
        case ...0:
            threeROC = Int((12391.51 * (pow(0.977896843, GW))) - 130) + (deltaT * 10)
        default:
            break
        }
        return threeROC
    }
}
