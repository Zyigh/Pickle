//
//  Utils.swift
//  PicklePOC
//
//  Created by Hugo Medina on 24/04/2019.
//  Copyright © 2019 Razeware. All rights reserved.
//

import Foundation
import UIKit

class Utils {
    public static var user: User? = nil
}

extension UIViewController {
    func present(_ id: String, storyboard: String = "Main", bundle: Bundle? = nil, completion: (()->Void)? = nil) {
        let st = UIStoryboard(name: storyboard, bundle: bundle)
        let view = st.instantiateViewController(withIdentifier: id)
        present(view, animated: true, completion: completion)
    }
}

extension UIColor {
    // Create a UIColor from RGB
    convenience init(red: Int, green: Int, blue: Int, a: CGFloat = 1.0) {
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: a
        )
    }
    
    // Custom colors (prefixed with "pickle")
    static let pickleDarkBlue =
        UIColor(red: 33.0 / 255.0, green: 28.0 / 255.0, blue: 76.0 / 255.0, alpha: 1.0)
    
    static let pickleGrey =
        UIColor(red: 133.0 / 255.0, green: 133.0 / 255.0, blue: 149.0 / 255.0, alpha: 1.0)
    
    static let picklePurple =
        UIColor(red: 101.0 / 255.0, green: 96.0 / 255.0, blue: 1.0, alpha: 1.0)
    
    static let pickleLightGrey =
        UIColor(white: 197.0 / 255.0, alpha: 0.1)
    
    static let picklePink =
        UIColor(red: 1.0, green: 212.0 / 255.0, blue: 212.0 / 255.0, alpha: 1.0)
    
    static let pickleLavender =
        UIColor(red: 144.0 / 255.0, green: 144.0 / 255.0, blue: 244.0 / 255.0, alpha: 1.0)
    
    static let pickleGreen =
        UIColor(red: 93.0 / 255.0, green: 175.0 / 255.0, blue: 84.0 / 255.0, alpha: 1.0)
    
    static let pickleRed =
        UIColor(red: 219.0 / 255.0, green: 95.0 / 255.0, blue: 95.0 / 255.0, alpha: 1.0)
    
    static let picklePaleGrey =
        UIColor(red: 245.0 / 255.0, green: 245.0 / 255.0, blue: 246.0 / 255.0, alpha: 1.0)
    
    static let pickleLightGreen =
        UIColor(red: 154.0 / 255.0, green: 237.0 / 255.0, blue: 145.0 / 255.0, alpha: 1.0)
}
