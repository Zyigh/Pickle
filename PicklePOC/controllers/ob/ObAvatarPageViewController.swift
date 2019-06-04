//
//  ObAvatarPageViewController.swift
//  gaiaApp
//
//  Created by Molika THAI on 28/01/2019.
//  Copyright © 2019 hetic. All rights reserved.
//

import UIKit

class ObAvatarPageViewController: UIPageViewController,UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    // MARK: - Properties
    
    var avatars = ["plant-pink-pot--thin", "plant-green-pot--wide-sad", "plant-pink-pot--wide", "plant-green-pot--round", "plant-purple-pot"]
    
    var currentIndex = 0
    var selectedAvatarSrc = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Data source is self
        dataSource = self
        delegate = self
        
        // First onboarding screen
        if let startVC = contentViewController(at: 0) {
            setViewControllers([startVC], direction: .forward, animated: true, completion: nil)
        }
    }
    
    // MARK: - Page View Controller Data Source
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! ObAvatarContentViewController).index
        index -= 1
        
        return contentViewController(at: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! ObAvatarContentViewController).index
        index += 1
        
        return contentViewController(at: index)
    }
    
    // MARK: - Helpers
    
    func contentViewController(at index: Int) -> ObAvatarContentViewController? {
        if index < 0 || index >= avatars.count {
            return nil
        }
        
        // Create a new view controller and pass suitable data
        let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)
        
        if let avatarContentViewController = storyboard.instantiateViewController(withIdentifier: "ObAvatarContentViewController") as? ObAvatarContentViewController {
            
            avatarContentViewController.avatarSrc = avatars[index]
            avatarContentViewController.index = index
            selectedAvatarSrc = avatars[index]
            
            return avatarContentViewController
        }
        
        return nil
    }

    func nextPage() {
        currentIndex += 1
    }

}
