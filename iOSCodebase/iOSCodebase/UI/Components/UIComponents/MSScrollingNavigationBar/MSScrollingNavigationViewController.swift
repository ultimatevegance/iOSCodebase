//
//  MSScrollingNavigationViewController.swift
//  iOSAppTemplateSwift
//
//  Created by xiongyongjie on 29/01/2018.
//  Copyright © 2018 MonsterTechStudio. All rights reserved.
//

import UIKit

/**
 A custom `UIViewController` that implements the base configuration.
 */
open class MSScrollingNavigationViewController: UIViewController, UIScrollViewDelegate, UINavigationControllerDelegate {
    
    // MARK: - ScrollView config
    
    /**
     On appear calls `showNavbar()` by default
     */
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let navigationController = self.navigationController as? MSScrollingNavigationController {
            navigationController.showNavbar(animated: true)
        }
    }
    
    /**
     On disappear calls `stopFollowingScrollView()` to stop observing the current scroll view, and perform the tear down
     */
    override open func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if let navigationController = self.navigationController as? MSScrollingNavigationController {
            navigationController.stopFollowingScrollView()
        }
    }
    
    /**
     Calls `showNavbar()` when a `scrollToTop` is requested
     */
    open func scrollViewShouldScrollToTop(_ scrollView: UIScrollView) -> Bool {
        if let navigationController = self.navigationController as? MSScrollingNavigationController {
            navigationController.showNavbar(animated: true)
        }
        return true
    }
    
}


