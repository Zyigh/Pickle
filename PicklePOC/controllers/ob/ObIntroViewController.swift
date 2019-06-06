//
//  ObIntroViewController.swift
//  gaiaApp
//
//  Created by Molika THAI on 23/01/2019.
//  Copyright © 2019 hetic. All rights reserved.
//

import UIKit

class ObIntroViewController: UIViewController {
    
    var uuid: UUID? = nil
    
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var nextButton: PickleButton!
    @IBOutlet var skipButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        ApiConnexion.createUser() {
            response in
            
            switch response {
            case .success(let user):
                guard let user = user as? User, let id = user.id else {
                    print("not a user...")
                    return
                }
                CurrentUser.user = user
                UserDefaults().setValue(value: id.uuidString, key: "uuid")
            case .error(let e):
                print(e.localizedDescription)
            }
        }
    }
    
    // MARK: - Actions
    
    @IBAction func skipOnboarding(sender: UIButton){
        nextObStepAvatar()
    }

    var ObIntroPageViewController: ObIntroPageViewController?
    
    @IBAction func nextOnboardingPage(sender: UIButton){
        if let index = ObIntroPageViewController?.currentIndex {
            switch index {
            case 0:
                ObIntroPageViewController?.nextPage()
            case 1:
                nextObStepAvatar()
            default:
                break
            }
        }
        
        updatePageControl()
    }
    
    // MARK: - Helpers
    
    func updatePageControl() {
        if let index = ObIntroPageViewController?.currentIndex {
            pageControl.currentPage = index
        }
    }
    
    func nextObStepAvatar(){
        let sb = UIStoryboard(name: "Onboarding", bundle: nil)
        if let nextObStepAvatarVC = sb.instantiateViewController(withIdentifier: "ObAvatarViewController") as? ObAvatarViewController {
            present(nextObStepAvatarVC, animated: true, completion: nil)
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let dest = segue.destination
        if let pageViewController = dest as? ObIntroPageViewController {
            ObIntroPageViewController = pageViewController
        }
    }

}
