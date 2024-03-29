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
    
    var textLayer: CATextLayer!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        
        textLayer = PickleTextLayer()
        textLayer.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        textLayer.alignmentMode = CATextLayerAlignmentMode.center
        textLayer.backgroundColor = UIColor.picklePurple.cgColor
        textLayer.cornerRadius = textLayer.frame.height / 2.0
//        textLayer.font = UIFont(name: "SF Pro Display Semibold", size: 18.0)
        textLayer.fontSize = 18.0
        
        self.layer.addSublayer(textLayer)
    }
}

class PickleTextLayer : CATextLayer {
    override func draw(in context: CGContext) {
        let height = self.bounds.size.height
        let fontSize = self.fontSize
        let yDiff = (height-fontSize)/2 - fontSize/10
        
        context.saveGState()
        context.translateBy(x: 0, y: yDiff)
        super.draw(in: context)
        context.restoreGState()
    }
}
