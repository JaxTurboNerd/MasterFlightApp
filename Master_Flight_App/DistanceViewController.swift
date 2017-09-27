//
//  DistanceViewController.swift
//  Master_Flight_App
//
//  Created by Gregory Boyd on 9/26/17.
//  Copyright © 2017 Gregory Boyd. All rights reserved.
//

import UIKit

class DistanceViewController: UIViewController, UITableViewDataSource {
    let data:[[String]] = [["Aircraft","Airports"],["Takeoff Speeds", "Takeoff Distances"]]
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.section][indexPath.row]
        return cell
    }
}
