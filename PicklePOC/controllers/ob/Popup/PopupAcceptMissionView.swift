//
//  PopupAcceptMissionView.swift
//  gaiaApp
//
//  Created by Molika THAI on 04/06/2019.
//  Copyright © 2019 hetic. All rights reserved.
//

import Foundation
import UIKit

class PopupAcceptMissionView : UIView {
    
    static let instance = PopupAcceptMissionView()
    var origin: UIViewController? = nil
    
    @IBOutlet var parentView: UIView!
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var popupTitle: UILabel!
    @IBOutlet weak var popupMsg: UILabel!
    @IBOutlet weak var backBtn: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        Bundle.main.loadNibNamed("PopupAcceptMissionView", owner: self, options: nil)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        popupView.layer.cornerRadius = 15
        popupView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        parentView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        parentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    func showPopup() {
        self.popupTitle.text = "Mission acceptée ! En réussissant cette mission vous économisez :"
        UIApplication.shared.keyWindow?.addSubview(parentView)
    }
    
    @IBAction func onClickBack(_ sender: Any) {
        parentView.removeFromSuperview()
        if let origin = origin {
            origin.dismiss(animated: true, completion: {
                let sb = origin.storyboard?.instantiateInitialViewController()
                if let sb = sb {
                    sb.reloadInputViews()
                }
            })
        }
    }
    
}
