//
//  PopupSuccessMissionView.swift
//  gaiaApp
//
//  Created by Molika THAI on 19/05/2019.
//  Copyright © 2019 hetic. All rights reserved.
//

import Foundation
import UIKit

class PopupSuccessMissionView: UIView {
    
    static let instance = PopupSuccessMissionView()
    
    @IBOutlet var parentView: UIView!
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var popupTitle: UILabel!
    @IBOutlet weak var backBtn: PickleButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        Bundle.main.loadNibNamed("PopupSuccessMissionView", owner: self, options: nil)
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
        self.popupTitle.text = "Félicitations ! Continuez sur cette lancée"
        UIApplication.shared.keyWindow?.addSubview(parentView)
    }
    
    @IBAction func onClickDone(_ sender: Any) {
        parentView.removeFromSuperview()
    }
    
}
