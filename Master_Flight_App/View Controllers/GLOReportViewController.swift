//
//  GLOReportViewController.swift
//  Master_Flight_App
//
//  Created by Gregory Boyd on 3/19/18.
//  Copyright © 2018 Gregory Boyd. All rights reserved.
//

import UIKit
import MessageUI

class GLOReportViewController: UIViewController, UITextViewDelegate, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var GLOReportTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //dismiss keyboard by tapping anywhere
        self.view.addGestureRecognizer(UITapGestureRecognizer(target:
            self.view, action: #selector(UIView.endEditing(_:))))
        
        //User Default settings for email
        let defaults = UserDefaults.standard
        defaults.set(GLOReportTextView.text, forKey: "defaultEmailFormat")
        
        if defaults.bool(forKey: "HasBeenSaved") == true {
            GLOReportTextView.text = defaults.string(forKey: "savedEmail")
        }
    }
    
    @objc func doneClicked() {
        view.endEditing(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func saveEmailView(_ sender: UIButton) {
        UserDefaults.standard.set(GLOReportTextView.text, forKey: "savedEmail")
        UserDefaults.standard.set(true, forKey: "HasBeenSaved")
        UserDefaults.standard.synchronize()
        showSavedEmailAlert()
    }
    
    @IBAction func clearEmailView(_ sender: UIButton) {
        GLOReportTextView.text = UserDefaults.standard.string(forKey: "defaultEmailFormat")
        UserDefaults.standard.set(false, forKey: "HasBeenSaved")
        UserDefaults.standard.synchronize()
    }
    
    @IBAction func sendEmail(_ sender: UIButton) {
        let mailComposeViewController = configureMailController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            showMailError()
        }
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
    
    func showSavedEmailAlert() {
        let savedEmailAlert = UIAlertController(title: "Email has been saved", message: "Your email has been saved", preferredStyle: .alert)
        let dismiss = UIAlertAction(title: "OK", style: .default, handler: nil)
        savedEmailAlert.addAction(dismiss)
        self.present(savedEmailAlert, animated: true, completion: nil)
        
    }
    // MARK: - Delegate
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        //Dismiss the mail compose view controller
        controller.dismiss(animated: true, completion: nil)
    }
}
