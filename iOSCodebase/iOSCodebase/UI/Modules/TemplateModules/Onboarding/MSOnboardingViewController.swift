//
//  MSOnboardingViewController.swift
//  iOSAppTemplateSwift
//
//  Created by xiongyongjie on 14/12/2017.
//  Copyright © 2017 MonsterTechStudio. All rights reserved.
//

import UIKit
import SwiftyOnboard
import Hero
class MSOnboardingViewController: UIViewController {
    var mOnboard: SwiftyOnboard!
    let mOnboardBackgroundColors: [UIColor] = [#colorLiteral(red: 0.9980840087, green: 0.3723873496, blue: 0.4952875376, alpha: 1),#colorLiteral(red: 0.2666860223, green: 0.5116362572, blue: 1, alpha: 1),#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)]
    let pagesCount = 3;
    var titles: [String] = ["Welcome to Confess!",
                           "It’s completely anonymous",
                           "Say something positive"]
    var subTitles: [String] = ["Confess lets you anonymously\n send confessions to your friends\n and receive confessions from them.",
                               "All confessions sent are\n anonymous. Your friends will only\n know that it came from one of\n their facebook friends.",
                               "Be nice to your friends.\n Send them confessions that\n will make them smile :)"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mOnboard = SwiftyOnboard.init(frame: UIScreen.main.bounds , style: .light)
        view.addSubview(mOnboard)
        mOnboard.delegate = self
        mOnboard.dataSource = self
    }
    
    @objc func handleSkip() {
        mOnboard?.goToPage(index: pagesCount - 1, animated: true)
    }
    
    @objc func handleContinue(sender: UIButton) {
        let index = sender.tag
        mOnboard?.goToPage(index: index + 1, animated: true)
    }
    @objc func getStarted() {
        RootVCSwitcher.switchRootViewController(rootViewController: MSTabBarViewController(), animated: true, completion: nil)
    }
}

extension MSOnboardingViewController: SwiftyOnboardDelegate, SwiftyOnboardDataSource {
    // MARK: - SwiftyOnboardDelegate SwiftyOnboardDataSource
    func swiftyOnboardNumberOfPages(_ swiftyOnboard: SwiftyOnboard) -> Int {
        return pagesCount
    }
    
    func swiftyOnboardPageForIndex(_ swiftyOnboard: SwiftyOnboard, index: Int) -> SwiftyOnboardPage? {
        let page = SwiftyOnboardPage()
        //Set the font and color for the labels:
        page.title.font = UIFont.boldSystemFont(ofSize: 26)
        page.subTitle.font = UIFont(name: "Lato-Regular", size: 16)
        //Set the text in the page:
        page.title.text = titles[index]
        page.subTitle.text = subTitles[index]
        return page
    }
    
    func swiftyOnboardBackgroundColorFor(_ swiftyOnboard: SwiftyOnboard, atIndex index: Int) -> UIColor? {
        return mOnboardBackgroundColors[index]
    }
    
    func swiftyOnboardViewForOverlay(_ swiftyOnboard: SwiftyOnboard) -> SwiftyOnboardOverlay? {
        let overlay = SwiftyOnboardOverlay()
        
        //Setup targets for the buttons on the overlay view:
        overlay.skipButton.addTarget(self, action: #selector(handleSkip), for: .touchUpInside)
        overlay.continueButton.addTarget(self, action: #selector(handleContinue), for: .touchUpInside)
        
        //Setup for the overlay buttons:
        overlay.continueButton.titleLabel?.font = UIFont(name: "Lato-Bold", size: 16)
        overlay.continueButton.setTitleColor(UIColor.white, for: .normal)
        overlay.skipButton.setTitleColor(UIColor.white, for: .normal)
        overlay.skipButton.titleLabel?.font = UIFont(name: "Lato-Heavy", size: 16)
        
        //Return the overlay view:
        return overlay
    }
    
    func swiftyOnboardOverlayForPosition(_ swiftyOnboard: SwiftyOnboard, overlay: SwiftyOnboardOverlay, for position: Double) {
        let currentPage = round(position)
        overlay.pageControl.currentPage = Int(currentPage)
        print(Int(currentPage))
        overlay.continueButton.tag = Int(position)
        
        if currentPage == 0.0 || currentPage == 1.0 {
            overlay.continueButton.setTitle("Continue", for: .normal)
            overlay.skipButton.setTitle("Skip", for: .normal)
            overlay.skipButton.isHidden = false
        } else {
            overlay.continueButton.setTitle("Get Started!", for: .normal)
            overlay.continueButton.addTarget(self, action: #selector(getStarted), for: .touchUpInside)
            overlay.skipButton.isHidden = true
        }
    }

}
