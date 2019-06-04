//
//  Utils.swift
//  PicklePOC
//
//  Created by Hugo Medina on 05/06/2019.
//  Copyright © 2019 Razeware. All rights reserved.
//

import Foundation
import UIKit

protocol PicklePopup {
    // Controller from which Popup was called, not necessarly first responder
    var origin : UIViewController? { get set }
    // Reload main page (first responder)
    func reloadOrigin() -> Void
}

extension PicklePopup {
    func reloadOrigin() {
        if let origin = origin {
            origin.dismiss(animated: true, completion: {
                if let sb = origin.storyboard?.instantiateInitialViewController() as? MissionsViewController {
                    sb.reloadInputViews()
                    sb.viewDidLoad()
                }
            })
        }
    }
}
