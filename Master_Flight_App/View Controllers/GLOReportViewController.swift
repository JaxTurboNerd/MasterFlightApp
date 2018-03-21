//
//  GLOReportViewController.swift
//  Master_Flight_App
//
//  Created by Gregory Boyd on 3/19/18.
//  Copyright © 2018 Gregory Boyd. All rights reserved.
//

import UIKit
import MessageUI

class GLOReportViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var GLOReportTextView: UITextView!
    
    @IBAction func sendEmail(_ sender: UIButton) {
        let mailComposeViewController = configureMailController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            showMailError()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Add Done Button to top of keypad
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        //pushes the done button to the right side of the toolbar
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        //adds done button to a toolbar above the keypad
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(self.doneClicked))
        
        toolBar.setItems([flexibleSpace, doneButton], animated: false)
        
        GLOReportTextView.inputAccessoryView = toolBar
        
        //dismiss keyboard by tapping anywhere
        self.view.addGestureRecognizer(UITapGestureRecognizer(target:
            self.view, action: #selector(UIView.endEditing(_:))))
    }
    
    @objc func doneClicked() {
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureMailController() -> MFMailComposeViewController {
        let mailComposeVC = MFMailComposeViewController()
        mailComposeVC.mailComposeDelegate = self
        
        mailComposeVC.setToRecipients(["gboyd69@yahoo.com"])
        mailComposeVC.setSubject("GLO REPORT")
        mailComposeVC.setMessageBody(GLOReportTextView.text, isHTML: false)
        
        return mailComposeVC
    }
    
    func showMailError() {
        let sendMailErrorAlert = UIAlertController(title: "Could not send email", message: "Your device could not send email", preferredStyle: .alert)
        let dismiss = UIAlertAction(title: "OK", style: .default, handler: nil)
        sendMailErrorAlert.addAction(dismiss)
        self.present(sendMailErrorAlert, animated: true, completion: nil)
    }
    // MARK: - Delegate
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        //Dismiss the mail compose view controller
        controller.dismiss(animated: true, completion: nil)
    }
}
