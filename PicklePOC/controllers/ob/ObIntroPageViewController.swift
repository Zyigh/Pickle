//
//  ObIntroPageViewController.swift
//  gaiaApp
//
//  Created by Molika THAI on 23/01/2019.
//  Copyright © 2019 hetic. All rights reserved.
//

import UIKit

class ObIntroPageViewController: UIPageViewController, UIPageViewControllerDataSource {

    // MARK: - Properties
    
    var pageHeadings = ["Un petit pas pour l'homme, un grand pas pour la planète", "Nous vous guidons tout au long de votre parcours"]
    var pageDescs = ["Gaïa est l’application qui vous aide au quotidien à adopter des habitudes plus responsables et respectueuses de l’environnement.", "De la réduction de vos déchets à l’adoption de nouveaux réflexes de consommation, Gaïa vous accompagne, pas à pas et à votre rythme."]
    var pageImgSrcs = ["onboarding1", "onboarding2"]
    var pageImgBgColors = ["pickleColor-lightGreen", "pickleColor-lavender"]
    
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Data source is self
        dataSource = self
        
        // First onboarding screen
        if let startVC = contentViewController(at: 0) {
            setViewControllers([startVC], direction: .forward, animated: true, completion: nil)
        }
    }
    
    // MARK: - Page View Controller Data Source
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! ObIntroContentViewController).index
        index -= 1
        
        return contentViewController(at: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! ObIntroContentViewController).index
        index += 1
        
        return contentViewController(at: index)
    }
    
    // MARK: - Helpers
    
    func contentViewController(at index: Int) -> ObIntroContentViewController? {
        if index < 0 || index >= pageHeadings.count {
            return nil
        }
        
        // Create a new view controller and pass suitable data
        let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)
        
        if let pageContentViewController = storyboard.instantiateViewController(withIdentifier: "ObIntroContentViewController") as? ObIntroContentViewController {
            pageContentViewController.heading = pageHeadings[index]
            pageContentViewController.desc = pageDescs[index]
            pageContentViewController.imgSrc = pageImgSrcs[index]
            pageContentViewController.imgBgColor = pageImgBgColors[index]
            pageContentViewController.index = index
            
            return pageContentViewController
        }
        
        return nil
    }
    
    func nextPage() {
        currentIndex += 1
        
        if let nextVC = contentViewController(at: currentIndex) {
            setViewControllers([nextVC], direction: .forward, animated: true, completion: nil)
        }
    }
}
