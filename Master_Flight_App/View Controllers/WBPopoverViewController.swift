//
//  WBPopoverViewController.swift
//  Master_Flight_App
//
//  Created by Gregory Boyd on 12/12/18.
//  Copyright © 2018 Gregory Boyd. All rights reserved.
//

import UIKit

class WBPopoverViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    //Array of aircraft in inventory
    var aircraftList = ["N403SK", "N480SK","N741SK", "N144CS", "N145CS", "N146CS", "N149CS"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.aircraftList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AircraftTableViewCell
        cell.setup(title: aircraftList[indexPath.row])
        return cell
    }
    //function for selecting the aircraft on the popover view.  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedAircraftCell = indexPath.row
        //switch to either LRT or AEW W&B view controller:
        switch selectedAircraftCell {
        case 0...2:
            //Instantiate new LRT W&B view controller to pass selected aircraft number to the W&B view controller label:
            let Storyboard = UIStoryboard(name: "Main", bundle: nil)
            let LRTVC = Storyboard.instantiateViewController(withIdentifier: "LRTWeightBalanceViewController") as! LRTWeightBalanceViewController
            LRTVC.selectedAircraft = aircraftList[indexPath.row]
            self.show(LRTVC, sender: self)
        case 3...6:
            let Storyboard = UIStoryboard(name: "Main", bundle: nil)
            let AEWVC = Storyboard.instantiateViewController(withIdentifier: "AEWWeightBalanceViewController") as! AEWWeightBalanceViewController
            AEWVC.finalSelectedAircraft = aircraftList[indexPath.row]
            self.show(AEWVC, sender: self)
        default:
            break
        }
    }    
}

