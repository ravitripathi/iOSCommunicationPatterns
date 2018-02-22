// This project takes input from other view controllers, and updates the current one. It's done with both delegate method,
// and the Observer-Notification Pattern
//
//  ViewController.swift
//  CommunicationPatterns
//
//  Created by Ravi Tripathi on 22/02/18.
//  Copyright © 2018 Ravi Tripathi. All rights reserved.
//

import UIKit

//Keys for Observer-Notification Pattern
let firstOptionNotif = "xyz.ravitripathi.first"
let secondOptionNotif = "xyz.ravitripathi.second"

class ViewController: UIViewController {
    
    //MARK: - Common
    @IBOutlet weak var data: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createObserver()
    }
    
    
    //MARK: - Observer-Notification Methods
    @IBAction func launchNotificationVC(_ sender: UIButton) {
        let notif = storyboard?.instantiateViewController(withIdentifier: "NotifcationViewController") as! NotificationViewController
        present(notif, animated: true, completion: nil)
    }
    
    //Variables corresponding to Notification Center Keys:
    let first = Notification.Name(rawValue: firstOptionNotif )
    let second = Notification.Name(rawValue: secondOptionNotif )
    
    //This is done so that when the controller is removed, it doesn't keep listening to those Notifications
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func createObserver(){
        //First
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updateLabel(notification:)), name: first, object: nil)
        
        //Second
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updateLabel(notification:)), name: second, object: nil)
        
        
    }
    
    @objc func updateLabel(notification: NSNotification){
        if notification.name == first{
           self.data.text = "first"
        }else{
            self.data.text = "second"
        }
        
    }
    
    
    
    //MARK: - Delegate Pattern
    @IBAction func launchSecondScreen(_ sender: UIButton) {
        let secondScreen = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        secondScreen.SecondScreenDelegate = self
        present(secondScreen, animated: true, completion: nil)
    }
   
    
}

//You can use this, or directly write ViewController:  UIViewController, choiceSelectionDelegate. While this method is cleaner,
// it increases the compile time for the file
extension ViewController : choiceSelectionDelegate {
    func pickedChoice(choice: String) {
        data.text = choice
    }
    
}

