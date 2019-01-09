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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let Storyboard = UIStoryboard(name: "Main", bundle: nil)
        let LRTVC = Storyboard.instantiateViewController(withIdentifier: "LRTWeightBalanceViewController") as! LRTWeightBalanceViewController
        LRTVC.finalSelectedAircraft = aircraftList[indexPath.row]
        self.show(LRTVC, sender: self)
    }    
}

