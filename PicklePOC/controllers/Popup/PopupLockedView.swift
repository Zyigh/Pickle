//
//  PopupLockedView.swift
//  gaiaApp
//
//  Created by Molika THAI on 17/05/2019.
//  Copyright © 2019 hetic. All rights reserved.
//

import Foundation
import UIKit

class PopupLockedView: UIView {
    
    static let instance = PopupLockedView()
    
    @IBOutlet var parentView: UIView!
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var popupTitle: UILabel!
    @IBOutlet weak var popupMsg: UILabel!
    @IBOutlet weak var backBtn: PickleButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        Bundle.main.loadNibNamed("PopupLockedView", owner: self, options: nil)
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
        self.popupTitle.text = "Rien ne sert de courir, il faut partir à point"
        self.popupMsg.text = "Ne vous précipitez pas ! Pour vous aider à adopter des gestes durables, vous ne pouvez accomplir que trois missions à la fois. Pour en débloquer de nouvelles, vous devez en terminer au moins une."
        UIApplication.shared.keyWindow?.addSubview(parentView)
    }
    
    @IBAction func onClickDone(_ sender: Any) {
        parentView.removeFromSuperview()
    }

}

