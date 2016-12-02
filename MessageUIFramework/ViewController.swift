//
//  ViewController.swift
//  MessageUIFramework
//
//  Created by Lydia Yu on 2016-11-18.
//  Copyright © 2016 Lydia Yu. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController, MFMailComposeViewControllerDelegate, MFMessageComposeViewControllerDelegate{

    @IBOutlet weak var msg: UIButton!
    @IBOutlet weak var email: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickEmail(_ sender: AnyObject) {
        if !MFMailComposeViewController.canSendMail() {
            print("Mail services are not available")
            return
        }
        let composeVC = MFMailComposeViewController()
        composeVC.mailComposeDelegate = self
        
        // Configure the fields of the interface.
        composeVC.setToRecipients(["ylinz1227@gmail.com"])
        composeVC.setSubject("Hello!")
        composeVC.setMessageBody("Hello!", isHTML: false)
        
        // Present the view controller modally.
        self.present(composeVC, animated: true, completion: nil)
    }
    
    @IBAction func clickMessage(_ sender: AnyObject) {
        if !MFMessageComposeViewController.canSendText() {
            print("SMS services are not available")
        }
        
        let composeVC2 = MFMessageComposeViewController()
        composeVC2.messageComposeDelegate = self
        
        // Configure the fields of the interface.
        composeVC2.recipients = ["7788625516"]
        composeVC2.body = "Hello!"
        
        // Present the view controller modally.
        self.present(composeVC2, animated: true, completion: nil)
    }
    
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController,
                                      didFinishWith result: MessageComposeResult) {
        // Check the result or perform other tasks.
        
        // Dismiss the message compose view controller.
        controller.dismiss(animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController,
                               didFinishWith result: MFMailComposeResult, error: Error?) {
        // Check the result or perform other tasks.
        
        // Dismiss the mail compose view controller.
        controller.dismiss(animated: true, completion: nil)
    }

}

