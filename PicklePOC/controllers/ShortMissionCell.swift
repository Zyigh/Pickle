//
//  ShortMissionCell.swift
//  PicklePOC
//
//  Created by Hugo Medina on 03/06/2019.
//  Copyright © 2019 Razeware. All rights reserved.
//

import Foundation
import UIKit

struct ShortMission {
    let image : UIImage?
    let category : String?
    let title : String?
}

class ShortMissionCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func configure(with model: ShortMission) {
        if let i = model.image {
            image.image = i
        }
        category.text = model.category
        title.text = model.title
    }
}
