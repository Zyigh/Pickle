//
//  ObAvatarContentViewController.swift
//  gaiaApp
//
//  Created by Molika THAI on 28/01/2019.
//  Copyright © 2019 hetic. All rights reserved.
//

import UIKit

class ObAvatarContentViewController: UIViewController {
    
    @IBOutlet var avatar: UIImageView!
    @IBOutlet var pageControl: UIPageControl!
    
    var index = 0
    var avatarSrc = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        avatar.image = UIImage(named: avatarSrc)
    }
}
