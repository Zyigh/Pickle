//
//  PopupSubscribeView.swift
//  gaiaApp
//
//  Created by Molika THAI on 19/05/2019.
//  Copyright © 2019 hetic. All rights reserved.
//

import Foundation
import UIKit

class PopupSubscribeView : UIView {
    
    static let instance = PopupSubscribeView()
    
    @IBOutlet var parentView: UIView!
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var popupTitle: UILabel!
    @IBOutlet weak var popupMsg: UILabel!
    @IBOutlet weak var subscribeBtn: PickleButton!
    @IBOutlet weak var backBtn: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        Bundle.main.loadNibNamed("PopupSubscribeView", owner: self, options: nil)
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
        self.popupTitle.text = "Gardez votre progression à l'abri !"
        self.popupMsg.text = "Afin de ne pas perdre votre progression et de bénéficier de nombreux avantages, inscrivez-vous."
        UIApplication.shared.keyWindow?.addSubview(parentView)
    }
    
    @IBAction func onClickSubscribe(_ sender: Any){
        print("Je m'inscris")
    }

    @IBAction func onClickBack(_ sender: Any) {
        parentView.removeFromSuperview()
    }
    
}

