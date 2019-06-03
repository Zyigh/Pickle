//
//  PickleCell.swift
//  PicklePOC
//
//  Created by Hugo Medina on 03/06/2019.
//  Copyright © 2019 Razeware. All rights reserved.
//

import Foundation
import UIKit

struct PickleContent {
    let pickle: String?
}

class PickleCell: UITableViewCell {
    
    @IBOutlet weak var pickleContentLabel: UILabel!
    @IBOutlet weak var rowNumberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        rowNumberLabel.layer.cornerRadius = CGFloat(100.0)
    }
}
