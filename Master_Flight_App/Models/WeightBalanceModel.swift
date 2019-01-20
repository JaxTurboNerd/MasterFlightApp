//
//  WeightBalanceModel.swift
//  Master_Flight_App
//
//  Created by Gregory Boyd on 12/12/18.
//  Copyright © 2018 Gregory Boyd. All rights reserved.
//

import Foundation

struct LRTWeightBalance {
    
    //Functions:
    func calculateTotalFuel(tank1and4: Double, tank2and3: Double, tank5: Double) -> (stringTotalFuelWeight: String, totalFuelWeight: Double) {
        let totalFuelWeight = tank1and4 + tank2and3 + tank5
        let stringTotalFuelWeight = String(totalFuelWeight)
        return (stringTotalFuelWeight, totalFuelWeight)
    }
    
    func calculateFlightStationWeight(pilot: Double, copilot: Double, flightEngineer: Double, flightObserver: Double) -> (stringFlightStationWeight: String, flightStationWeight: Double) {
        let flightStationWeight = pilot + copilot + flightEngineer + flightObserver
        let stringFlightStationWeight = String(flightStationWeight)
        
        return (stringFlightStationWeight, flightStationWeight)
    }
    
    func calculateTubeWeight(portFwd: Double, stbFwd: Double, tfo1: Double, tfo2: Double, tfo3: Double, tfo4: Double, firstClass: Double, portAft: Double, stbAft: Double, galley: Double, bunk: Double) -> (stringTubeWeight: String, tubeWeight: Double) {
        let tubeWeight = portFwd + stbFwd + tfo1 + tfo2 + tfo3 + tfo4 + firstClass + portAft + stbAft + galley + bunk
        let stringTubeWeight = String(tubeWeight)
        return (stringTubeWeight, tubeWeight)
    }
    
    func calculateCargoWeight(cargoB: Double, cargoC: Double, cargoD: Double, cargoE: Double, cargoF: Double, cargoG: Double, bombBay: Double, aftFirstClass: Double) -> (stringCargoWeight: String, cargoWeight: Double) {
        let cargoWeight = cargoB + cargoC + cargoD + cargoE + cargoF + cargoG + bombBay + aftFirstClass
        let stringCargoWeight = String(cargoWeight)
        return (stringCargoWeight, cargoWeight)
        
    }
    
    func calculateZFW(basicWeight: Double, flightStationWeight: Double, tubeWeight: Double, cargoWeight: Double) -> (stringZFW: String, zeroFuelWeight: Double) {
        let zeroFuelWeight = basicWeight + flightStationWeight + tubeWeight + cargoWeight
        let stringZFW = String(zeroFuelWeight)
        return (stringZFW, zeroFuelWeight)
    }
    
    func calculateGrossWeight(zeroFuelWeight: Double, totalFuelWeight: Double) -> (stringGW: String, grossWeight: Double) {
        let grossWeight = zeroFuelWeight + totalFuelWeight
        let stringGrossWeight = String(grossWeight)
        return (stringGrossWeight, grossWeight)
    }
    
    /*
    func calculateCenterOfGravity() -> (zeroFuelWeight: String, grossWeight: String, centerOfGravity: String) {
        
    }
 */
}

/*
 
//Need to adjust the different textfield for the AEW VC.
 
struct AEWWeightBalance {
    
    //Functions:
    func calculateTotalFuel(tank1and4: Double, tank2and3: Double, tank5: Double) -> (stringTotalFuelWeight: String, totalFuelWeight: Double) {
        let totalFuelWeight = tank1and4 + tank2and3 + tank5
        let stringTotalFuelWeight = String(totalFuelWeight)
        return (stringTotalFuelWeight, totalFuelWeight)
    }
    
    func calculateFlightStationWeight(pilot: Double, copilot: Double, flightEngineer: Double, flightObserver: Double) -> (stringFlightStationWeight: String, flightStationWeight: Double) {
        let flightStationWeight = pilot + copilot + flightEngineer + flightObserver
        let stringFlightStationWeight = String(flightStationWeight)
        
        return (stringFlightStationWeight, flightStationWeight)
    }
    
    func calculateTubeWeight(portFwd: Double, stbFwd: Double, tfo1: Double, tfo2: Double, tfo3: Double, tfo4: Double, firstClass: Double, portAft: Double, stbAft: Double, galley: Double, bunk: Double) -> (stringTubeWeight: String, tubeWeight: Double) {
        let tubeWeight = portFwd + stbFwd + tfo1 + tfo2 + tfo3 + tfo4 + firstClass + portAft + stbAft + galley + bunk
        let stringTubeWeight = String(tubeWeight)
        return (stringTubeWeight, tubeWeight)
    }
    
    func calculateCargoWeight(cargoB: Double, cargoC: Double, cargoD: Double, cargoE: Double, cargoF: Double, cargoG: Double, bombBay: Double, aftFirstClass: Double) -> (stringCargoWeight: String, cargoWeight: Double) {
        let cargoWeight = cargoB + cargoC + cargoD + cargoE + cargoF + cargoG + bombBay + aftFirstClass
        let stringCargoWeight = String(cargoWeight)
        return (stringCargoWeight, cargoWeight)
        
    }
    
    func calculateZFW(basicWeight: Double, flightStationWeight: Double, tubeWeight: Double, cargoWeight: Double) -> (stringZFW: String, zeroFuelWeight: Double) {
        let zeroFuelWeight = basicWeight + flightStationWeight + tubeWeight + cargoWeight
        let stringZFW = String(zeroFuelWeight)
        return (stringZFW, zeroFuelWeight)
    }
    
    func calculateGrossWeight(zeroFuelWeight: Double, totalFuelWeight: Double) -> (stringGW: String, grossWeight: Double) {
        let grossWeight = zeroFuelWeight + totalFuelWeight
        let stringGrossWeight = String(grossWeight)
        return (stringGrossWeight, grossWeight)
    }
    
    /*
     func calculateCenterOfGravity() -> (zeroFuelWeight: String, grossWeight: String, centerOfGravity: String) {
     
     }
     */
}
*/
