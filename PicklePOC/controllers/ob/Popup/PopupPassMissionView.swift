//
//  PopupPassMissionView.swift
//  gaiaApp
//
//  Created by Molika THAI on 19/05/2019.
//  Copyright © 2019 hetic. All rights reserved.
//

import Foundation
import UIKit

class PopupPassMissionView : UIView {
    
    static let instance = PopupPassMissionView()
    
    @IBOutlet var parentView: UIView!
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var popupTitle: UILabel!
    @IBOutlet weak var passBtn: PickleButton!
    @IBOutlet weak var backBtn: PickleButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        Bundle.main.loadNibNamed("PopupPassMissionView", owner: self, options: nil)
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
        
        backBtn.setSecondaryButtonStyle()
    }
    
    func showPopup() {
        self.popupTitle.text = "Êtes-vous sûr(e) de vouloir passer cette mission ?"
        UIApplication.shared.keyWindow?.addSubview(parentView)
    }
    
    @IBAction func onClickPass(_ sender: Any){
        print("Passer la mission")
    }
    
    @IBAction func onClickBack(_ sender: Any) {
        parentView.removeFromSuperview()
    }
    
}
