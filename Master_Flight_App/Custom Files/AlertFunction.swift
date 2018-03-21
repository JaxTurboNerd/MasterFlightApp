//
//  AlertFunction.swift
//  Master_Flight_App
//
//  Created by Gregory Boyd on 10/2/17.
//  Copyright © 2017 Gregory Boyd. All rights reserved.
//

import UIKit

extension UIViewController {
    func emptyAlert(alertTitle: String, alertMessage:String) -> Void {
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func outOfRangeAlert(alertTitle: String, alertMessage:String)-> Void {
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Warning", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
