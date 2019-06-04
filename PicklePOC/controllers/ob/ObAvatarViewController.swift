//
//  ObAvatarViewController.swift
//  gaiaApp
//
//  Created by Molika THAI on 23/01/2019.
//  Copyright © 2019 hetic. All rights reserved.
//

import UIKit

class ObAvatarViewController: UIViewController {
    
    @IBOutlet var chooseButton: PickleButton!
    @IBOutlet var pageControl: UIPageControl!
    
    var ObAvatarPageViewController: ObAvatarPageViewController?
    var selectedAvatarSrc = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        chooseButton.setEnabledButtonStyle()
    }
    
    @IBAction func goToNameChoice(sender: UIButton){
        nextObStepName()
//        nextObStepLevel()
    }

    func updatePageControl() {
        if let index = ObAvatarPageViewController?.currentIndex {
            pageControl.currentPage = index
        }
    }
    
    func nextObStepLevel(){
        let sb = UIStoryboard(name: "Onboarding", bundle: nil)
        if let nextObStepLevelVC = sb.instantiateViewController(withIdentifier: "ObLevelViewController") as? ObLevelViewController {
            present(nextObStepLevelVC, animated: true, completion: nil)
        }
    }
    
    func nextObStepName(){
        let sb = UIStoryboard(name: "Onboarding", bundle: nil)
        if let nextObStepNameVC = sb.instantiateViewController(withIdentifier: "ObNameViewController") as? ObNameViewController {
            present(nextObStepNameVC, animated: true, completion: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let dest = segue.destination
        if let pageViewController = dest as? ObAvatarPageViewController {
            ObAvatarPageViewController = pageViewController
            selectedAvatarSrc = pageViewController.selectedAvatarSrc
        }
        
        if dest is ObLevelViewController
        {
            let vc = dest as? ObLevelViewController
            vc?.selectedAvatarSrc = selectedAvatarSrc
        }

    }
}
