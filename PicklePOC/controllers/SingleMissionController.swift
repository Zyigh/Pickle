//
//  SingleMissionController.swift
//  PicklePOC
//
//  Created by Hugo Medina on 25/04/2019.
//  Copyright © 2019 Razeware. All rights reserved.
//

import Foundation
import UIKit

class SingleMissionController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passerButton.layer.borderWidth = 1
        passerButton.layer.borderColor = UIColor.pickleDarkBlue.cgColor
    }
    
    @IBOutlet weak var passerButton: UIButton!
    
    @IBAction func passMission(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
