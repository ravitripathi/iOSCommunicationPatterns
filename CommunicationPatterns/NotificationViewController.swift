//
//  NotifcationViewController.swift
//  CommunicationPatterns
//
//  Created by Ravi Tripathi on 22/02/18.
//  Copyright © 2018 Ravi Tripathi. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController {

    @IBAction func firstButton(_ sender: UIButton) {
        let name = Notification.Name(rawValue: firstOptionNotif )
        NotificationCenter.default.post(name: name, object: nil)
         dismiss(animated: true, completion: nil)
    }
    
    @IBAction func secondButton(_ sender: UIButton) {
        let name = Notification.Name(rawValue: secondOptionNotif )
        NotificationCenter.default.post(name: name, object: nil)
         dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

   
}
