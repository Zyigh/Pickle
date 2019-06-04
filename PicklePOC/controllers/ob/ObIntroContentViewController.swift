//
//  ObIntroContentViewController.swift
//  gaiaApp
//
//  Created by Molika THAI on 23/01/2019.
//  Copyright © 2019 hetic. All rights reserved.
//

import UIKit

class ObIntroContentViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet var headingLabel: UILabel! {
        didSet {
            headingLabel.numberOfLines = 0
        }
    }
    
    @IBOutlet var descLabel: UILabel! {
        didSet {
            descLabel.numberOfLines = 0
        }
    }
    
    @IBOutlet var contentImageView: UIImageView!
    @IBOutlet var imageViewContainer: UIView!
    
    // MARK: - Properties
    
    var index = 0;
    var heading = ""
    var desc = ""
    var imgSrc = ""
    var imgBgColor = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        headingLabel.text = heading
        descLabel.text = desc
        contentImageView.image = UIImage(named: imgSrc)
        imageViewContainer.backgroundColor = UIColor(named: imgBgColor)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
