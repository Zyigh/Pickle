//
//  Buttons.swift
//  gaiaApp
//
//  Created by Molika THAI on 23/01/2019.
//  Copyright © 2019 hetic. All rights reserved.
//

import Foundation
import UIKit

class PickleButton: UIButton {
    override func awakeFromNib() {
        self.layer.cornerRadius = 12.0
        self.titleLabel?.font = UIFont(name: UIFont.fontNames(forFamilyName:
            "SF Pro Display")[0], size: 16)
    }
    
    func setEnabledButtonStyle() {
        self.setTitleColor(UIColor.white, for: .normal)
        self.layer.backgroundColor = UIColor.pickleDarkBlue.cgColor
    }
    
    func setDisabledButtonStyle() {
        self.setTitleColor(UIColor.pickleGrey, for: .disabled)
        self.layer.backgroundColor = UIColor.picklePaleGrey.cgColor
    }
    
    func setSecondaryButtonStyle() {
        self.setTitleColor(UIColor.pickleDarkBlue, for: .normal)
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.borderColor = UIColor.pickleDarkBlue.cgColor
        self.layer.borderWidth = 1
    }
}
