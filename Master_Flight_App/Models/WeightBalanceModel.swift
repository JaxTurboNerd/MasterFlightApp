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
    func calculateTotalFuel(tank1: Int, tank2: Int, tank3: Int, tank4: Int, tank5: Int) -> Int {
        let totalFuelWeight = tank1 + tank2 + tank3 + tank4 + tank5
        return totalFuelWeight
    }
    
    func calculateFlightStationWeight(pilot: Int, copilot: Int, flightEngineer: Int, flightObserver: Int) -> Int {
        let flightStationWeight = pilot + copilot + flightEngineer + flightObserver
        return flightStationWeight
    }
    
    func calculateTubeWeight(portFwd: Int, stbFwd: Int, tfo1: Int, tfo2: Int, tfo3: Int, tfo4: Int, firstClass: Int, portAft: Int, stbAft: Int) -> Int {
        let tubeWeight = portFwd + stbFwd + tfo1 + tfo2 + tfo3 + tfo4 + firstClass + portAft + stbAft
        return tubeWeight
    }
    
    func calculateCargoWeight(cargoB: Int, cargoC: Int, cargoD: Int, cargoE: Int, cargoF: Int, cargoG: Int, bombBay: Int, aftFirstClass: Int) -> Int {
        let cargoWeight = cargoB + cargoC + cargoD + cargoE + cargoF + cargoG + bombBay + aftFirstClass
        return cargoWeight
        
    }
    
    func calculateZFW(basicWeight: Int, flightStationWeight: Int, tubeWeight: Int, cargoWeight: Int) -> Int {
        let zeroFuelWeight = basicWeight + flightStationWeight + tubeWeight + cargoWeight
        return zeroFuelWeight
    }
    
    func calculateGrossWeight(zeroFuelWeight: Int, totalFuelWeight: Int) -> Int {
        let grossWeight = zeroFuelWeight + totalFuelWeight
        return grossWeight
    }
    
    func calculateMoment(pilotWeight: Double, coPilotWeight: Double, feWeight: Double, fsoWeight: Double, portFwdObs: Double, stbFwdObs: Double, tfo1Weight: Double, tfo2Weight: Double, tfo3Weight: Double, tfo4Weight: Double, firstClassWeight: Double, portAftObsWeight: Double, stbAftObsWeight: Double, aftFirstClassWeight: Double, cargoBWeight: Double, cargoCWeight: Double, cargoDWeight: Double, cargoEWeight: Double, cargoFWeight: Double, cargoGWeight: Double, tank1Weight: Double, tank2Weight: Double, tank3Weight: Double, tank4Weight: Double, tank5Weight: Double, bombBayWeight: Double, aircraftMoment: Double) -> Double {
        //Need to get bunk ARM (possibly same as cargo G?
        let totalMoment = (pilotWeight * 222.0) + (coPilotWeight * 222.0) + (feWeight * 227.0) + (fsoWeight * 256.0) + (tfo1Weight * 572.0) + (tfo2Weight * 572.0) + (tfo3Weight * 572.0) + (tfo4Weight * 572) + (firstClassWeight * 768.0) + (portAftObsWeight * 889.0) + (stbAftObsWeight * 889.0) + (aftFirstClassWeight * 816.0) + (cargoBWeight * 227.0) + (cargoCWeight * 333) + (cargoDWeight * 565) + (cargoEWeight * 768) + (cargoFWeight * 889) + (cargoGWeight * 1021) + (tank1Weight * 606.2) + (tank2Weight * 624.5) + (tank3Weight * 624.5) + (tank4Weight * 606.2) + (tank5Weight * 594.5) + (bombBayWeight * 400.0) + (aircraftMoment * 1000)
        
        return totalMoment
    }
    
    func calculateCenterOfGravity(totalMoment: Double, grossWeight: Double) -> Double {
        //Mac numbers:
        let leadingEdgeMAC = 545.9
        
        //let trailingEdgeMAC = 714.6
        let MAC = 168.7
        
        //Calculate CG in Datum:
        let datumCG = totalMoment/grossWeight
        
        //Calculate CG:
        let centerOfGravity = ((((datumCG - leadingEdgeMAC)/MAC) * 1000).rounded())/10 // rounded to xx.x format
        
        return centerOfGravity
    }
 
}

/*
 
//Need to adjust the different textfields for the AEW VC.
 
struct AEWWeightBalance {
 //Functions:
 func calculateTotalFuel(tank1and4: Int, tank2and3: Int, tank5: Int) -> Int {
 let totalFuelWeight = tank1and4 + tank2and3 + tank5
 return totalFuelWeight
 }
 
 func calculateFlightStationWeight(pilot: Int, copilot: Int, flightEngineer: Int, flightObserver: Int) -> Int {
 let flightStationWeight = pilot + copilot + flightEngineer + flightObserver
 return flightStationWeight
 }
 
 func calculateTubeWeight(portFwd: Int, stbFwd: Int, tfo1: Int, tfo2: Int, tfo3: Int, tfo4: Int, firstClass: Int, portAft: Int, stbAft: Int, galley: Int, bunk: Int) -> Int {
 let tubeWeight = portFwd + stbFwd + tfo1 + tfo2 + tfo3 + tfo4 + firstClass + portAft + stbAft + galley + bunk
 return tubeWeight
 }
 
 func calculateCargoWeight(cargoB: Int, cargoC: Int, cargoD: Int, cargoE: Int, cargoF: Int, cargoG: Int, bombBay: Int, aftFirstClass: Int) -> Int {
 let cargoWeight = cargoB + cargoC + cargoD + cargoE + cargoF + cargoG + bombBay + aftFirstClass
 return cargoWeight
 
 }
 
 func calculateZFW(basicWeight: Int, flightStationWeight: Int, tubeWeight: Int, cargoWeight: Int) -> Int {
 let zeroFuelWeight = basicWeight + flightStationWeight + tubeWeight + cargoWeight
 //Never used?: let stringZFW = String(zeroFuelWeight)
 return zeroFuelWeight
 }
 
 func calculateGrossWeight(zeroFuelWeight: Int, totalFuelWeight: Int) -> Int {
 let grossWeight = zeroFuelWeight + totalFuelWeight
 //let stringGrossWeight = String(grossWeight)
 return grossWeight
 }
 
 func calculateMoment(pilotWeight: Double, coPilotWeight: Double, feWeight: Double, fsoWeight: Double, portFwdObs: Double, stbFwdObs: Double, tfo1Weight: Double, tfo2Weight: Double, tfo3Weight: Double, tfo4Weight: Double, firstClassWeight: Double, portAftObsWeight: Double, stbAftObsWeight: Double, galleyWeight: Double, bunkWeight:Double, aftFirstClassWeight: Double, cargoBWeight: Double, cargoCWeight: Double, cargoDWeight: Double, cargoEWeight: Double, cargoFWeight: Double, cargoGWeight: Double, tank14Weight: Double, tank23Weight: Double, tank5Weight: Double, bombBayWeight: Double, aircraftMoment: Double) -> Double {
 //Need to get bunk ARM (possibly same as cargo G?
 let totalMoment = (pilotWeight * 222.0) + (coPilotWeight * 222.0) + (feWeight * 227.0) + (fsoWeight * 256.0) + (tfo1Weight * 572.0) + (tfo2Weight * 572.0) + (tfo3Weight * 572.0) + (tfo4Weight * 572) + (firstClassWeight * 768.0) + (portAftObsWeight * 889.0) + (stbAftObsWeight * 889.0) + (galleyWeight * 950.0) + (aftFirstClassWeight * 816.0) + (cargoBWeight * 227.0) + (cargoCWeight * 333) + (cargoDWeight * 565) + (cargoEWeight * 768) + (cargoFWeight * 889) + (cargoGWeight * 1021) + (tank14Weight * 606.2) + (tank23Weight * 624.5) + (tank5Weight * 594.5) + (bombBayWeight * 400.0) + (aircraftMoment * 1000)
 //may need to multiply aircraftMoment * 1000?
 return totalMoment
 }
 
 func calculateCenterOfGravity(totalMoment: Double, grossWeight: Double) -> Double {
 //Mac numbers:
 let leadingEdgeMAC = 545.9
 //let trailingEdgeMAC = 714.6
 let MAC = 168.7
 
 //Calculate CG in Datum:
 let datumCG = totalMoment/grossWeight
 
 //Calculate CG:
 let centerOfGravity = ((((datumCG - leadingEdgeMAC)/MAC) * 1000).rounded())/10
 
 return centerOfGravity
 }
 
}
*/
