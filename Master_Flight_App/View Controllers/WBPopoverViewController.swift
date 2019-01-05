//
//  WBPopoverViewController.swift
//  Master_Flight_App
//
//  Created by Gregory Boyd on 12/12/18.
//  Copyright © 2018 Gregory Boyd. All rights reserved.
//

import UIKit

class WBPopoverViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var popoverView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    var aircraftNumbers = ["N403SK", "N480SK","N741SK", "N144CS", "N145CS", "N146CS", "N149CS"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.aircraftNumbers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = aircraftNumbers[indexPath.row]
        return cell
    }
    

    
}
