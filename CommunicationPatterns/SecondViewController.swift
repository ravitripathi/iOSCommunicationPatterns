//
//  SecondViewController.swift
//  CommunicationPatterns
//
//  Created by Ravi Tripathi on 22/02/18.
//  Copyright © 2018 Ravi Tripathi. All rights reserved.
//

import UIKit

protocol choiceSelectionDelegate{
    func pickedChoice(choice: String)
}

class SecondViewController: UIViewController {

    var SecondScreenDelegate : choiceSelectionDelegate?
    
    @IBAction func firstButton(_ sender: UIButton) {
        SecondScreenDelegate?.pickedChoice(choice: "You clicked First Button")
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func secondButton(_ sender: UIButton) {
        SecondScreenDelegate?.pickedChoice(choice: "You clicked Second Button")
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
