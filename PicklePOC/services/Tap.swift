//
//  Tap.swift
//  PicklePOC
//
//  Created by Hugo Medina on 02/06/2019.
//  Copyright © 2019 Razeware. All rights reserved.
//

import Foundation
import UIKit

class Tap {
    static func addTapGesture(view: UIView, target: Any, action: Selector) {
        let tap = UITapGestureRecognizer(target: target, action: action)
        view.addGestureRecognizer(tap)
    }
}
