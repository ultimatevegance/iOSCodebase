//
//  MSPageMenuViewController.swift
//  iOSAppTemplateSwift
//
//  Created by xiongyongjie on 18/12/2017.
//  Copyright © 2017 MonsterTechStudio. All rights reserved.
//

import UIKit
import Foundation

// MARK: Protocols

public protocol IndicatorInfoSource {
    func indicatorInfoSource(for pageViewController: MSScrollingPageViewController) -> MSPageIndicatorInfo
}

public protocol ScrollingPageDelegate: class {
    func updateIndicator(for viewController: MSScrollingPageViewController, fromIndex: Int, toIndex: Int)
}

public protocol ScrollingPageIsProgressiveDelegate: ScrollingPageDelegate {
    func updateIndicator(for viewController: MSScrollingPageViewController,fromIndex: Int, toIndex: Int, withProgressPercentage progressPercentage: CGFloat, indexWasChanged: Bool)
}

public protocol ScrollPageDataSource: class {
    func viewControllers(for pageViewController: MSScrollingPageViewController) -> [UIViewController]
}

// MARK: MSScrollingPageViewController

open class MSScrollingPageViewController: UIViewController, UIScrollViewDelegate {
    open var containerView: UIScrollView!
    open weak var delegate: ScrollingPageDelegate?
    open weak var dataSource: ScrollPageDataSource?
    
    // default behaviour
    open var pagerBehaviour = MSScrollingPageBehaviour.progressive(skipIntermediateViewControllers: true, elasticIndicatorLimit: true)
    
    open private(set) var viewControllers = [UIViewController]()
    open private(set) var currentIndex = 0
    open private(set) var preCurrentIndex = 0 // used *only* to store the index to which move when the pager becomes visible
    
    open var pageWidth: CGFloat {
        return containerView.bounds.width
    }
    
    open var scrollDirection: MSPageScrollDirection {
        if containerView.contentOffset.x > lastContentOffset {
            return .left
        } else if containerView.contentOffset.x < lastContentOffset {
            return .right
        }
        return .none
    }
    
    open var scrollPercentage: CGFloat {
        if scrollDirection != .right {
            let module = fmod(containerView.contentOffset.x, pageWidth)
            return module == 0.0 ? 1.0 : module / pageWidth
        }
        return 1 - fmod(containerView.contentOffset.x >= 0 ? containerView.contentOffset.x : pageWidth + containerView.contentOffset.x, pageWidth) / pageWidth
    }
    override open func viewDidLoad() {
        super.viewDidLoad()
        let conteinerViewAux = containerView ?? {
            let containerView = UIScrollView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
            containerView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            return containerView
            }()
        containerView = conteinerViewAux
        if containerView.superview == nil {
            view.addSubview(containerView)
        }
        containerView.bounces = true
        containerView.alwaysBounceHorizontal = true
        containerView.alwaysBounceVertical = false
        containerView.scrollsToTop = false
        containerView.delegate = self
        containerView.showsVerticalScrollIndicator = false
        containerView.showsHorizontalScrollIndicator = false
        containerView.isPagingEnabled = true
        
        let childController = viewControllers[currentIndex]
        addChildViewController(childController)
        childController.view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        containerView.addSubview(childController.view)
        childController.didMove(toParentViewController: self)
        

    }
    
    
    private var scrollingPageChildViewControllersForScrolling: [UIViewController]?
    private var lastPageNumber = 0
    private var lastContentOffset: CGFloat = 0.0
    private var pageBeforeRotate = 0
    private var lastSize = CGSize(width: 0, height: 0)
    internal var isViewRotating = false
    internal var isViewAppearing = false

}
