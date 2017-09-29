//
//  DistanceViewController.swift
//  Master_Flight_App
//
//  Created by Gregory Boyd on 9/26/17.
//  Copyright © 2017 Gregory Boyd. All rights reserved.
//

import UIKit

class TakeoffPerformanceViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let data:[[String]] = [["Takeoff Power","LRT Takeoff Speed Schedule","AEW Takeoff Speed Schedule"],["Mission Data", "Flight Time Calculator"]]
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
