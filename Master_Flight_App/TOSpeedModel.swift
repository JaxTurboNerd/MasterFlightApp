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
            if grossWeight <= 108.0 {Vro = 115.0}
            else if grossWeight > 108.0 && grossWeight <= 114.0 {
                Vro = round(0.582 * grossWeight + 52.6)
            }
            else if grossWeight > 114.0 {
                Vro = round(0.588 * grossWeight + 52.2)
            }
        }
        else if aircraftType == "AEW" {
            if grossWeight <= 117.8 {Vro = 120}
            else {Vro = round(0.62 * grossWeight + 47.1)}
        }
        return Vro
    }
}

struct CalculateLiftOffSpeed {
    var Vlof = 0.0
    mutating func LiftOffSpeed(grossWeight: Double, aircraftType: String) -> Double {
        if aircraftType == "LRT" {
            if grossWeight <= 108.0 {Vlof = 108.0}
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
