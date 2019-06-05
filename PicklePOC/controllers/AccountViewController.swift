//
//  AccountViewController.swift
//  PicklePOC
//
//  Created by Hugo Medina on 05/06/2019.
//  Copyright © 2019 Razeware. All rights reserved.
//

import Foundation
import UIKit

class AccountViewController: UIViewController {
    
    @IBOutlet weak var gif: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gif.loadGif(name: "inscription")
    }
    
}
