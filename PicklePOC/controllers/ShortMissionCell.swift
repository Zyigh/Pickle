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
    
    var mission: Mission? = nil

    public func configure(with model: Mission) {
        // Will be used to display single
        mission = model
        if let imageName = model.image,
           let u = URL(string: "\(ApiConnexion.baseUrl)/\(imageName)"),
           let d = try? Data(contentsOf: u) {
            image.image = UIImage(data: d)
        } else {
            image.image = UIImage(imageLiteralResourceName: "pickle-logo")
        }
        
        category.text = model.mainSubject
        title.text = model.description
    }
    
    @objc func missionTap(gesture: UITapGestureRecognizer) {
        if let missionCtrl = parentViewController as? MissionsViewController {
            missionCtrl.present("single", storyboard: "Main", bundle: nil) {
                ctrl in
                
                if let ctrl = ctrl as? SingleMissionController {
                    ctrl.mission = self.mission
                }
            }
        }
    }
}

extension UIView {
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
}
