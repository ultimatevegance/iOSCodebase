//
//  MSTabBarViewController.swift
//  MasterAppTemplateForiOS
//
//  Created by MonsterSucker on 14/12/2017.
//  Copyright © 2017 MonsterTechStudio. All rights reserved.
//

import UIKit

class MSTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
 
    }
    
    func setup() {
        let tp1RootNav = MSScrollingNavigationController(rootViewController: MSTemplate1ViewController());
        let tp2RootNav = MSScrollingNavigationController(rootViewController: MSTemplate2ViewController());
        let tp3RootNav = MSScrollingNavigationController(rootViewController: MSTemplate3ViewController());
        self.viewControllers = [tp1RootNav,tp2RootNav,tp3RootNav];
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
