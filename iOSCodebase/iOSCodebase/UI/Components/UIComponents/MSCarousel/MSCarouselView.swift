//
//  MSCarouselView.swift
//  iOSAppTemplateSwift
//
//  Created by MonsterSucker on 14/12/2017.
//  Copyright © 2017 MonsterTechStudio. All rights reserved.
//

import UIKit
import FSPagerView
import Kingfisher

class MSCarouselView: UIView, FSPagerViewDataSource,FSPagerViewDelegate{
    // MARK: - Public properties
    open var imageUrls: [String]! // Must:slide images Url String
    open var titles: [String]? // Optional: slide titles below
    open var slideImagePlaceholder: UIImage? // Optional: slide default placeholder image
    open var slideItemSize: CGSize = CGSize() {
        didSet {
            self.pagerView.itemSize = slideItemSize
        }
    }
    open var slideItemSpacing: CGFloat = 0 {
        didSet {
            self.pagerView.interitemSpacing = slideItemSpacing
        }
    }
    // MARK: - Privite properties
    fileprivate  var pagerView: FSPagerView!
    fileprivate  var pageControl: FSPageControl!
    
    init(frame: CGRect,imageUrlArray: Array<String>,isInfinite: Bool,automaticSlidingInterval: CGFloat, tranformerStyle:FSPagerViewTransformerType, pageControlHeight: CGFloat, pageIndicatorFillColor: UIColor, pageIndicatorStrokeColor: UIColor) {
        super.init(frame: frame)
        pagerView = FSPagerView(frame: frame)
        pagerView.delegate = self
        pagerView.dataSource = self
        pagerView.isInfinite = isInfinite
        pagerView.transformer = FSPagerViewTransformer(type: tranformerStyle)
        pagerView.automaticSlidingInterval = automaticSlidingInterval
        pageControl = FSPageControl.init(frame: CGRect(x: 0, y: pagerView.frame.maxY - pageControlHeight, width: pagerView.frame.width, height: pageControlHeight))
        pageControl.numberOfPages = imageUrlArray.count
        pageControl.setFillColor(pageIndicatorFillColor, for: .selected)
        pageControl.setStrokeColor(pageIndicatorStrokeColor, for: .selected)
        self.addSubview(pagerView)
        self.addSubview(pageControl)
        self.imageUrls = imageUrlArray
        pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK - Privite Methods
   internal func numberOfItems(in pagerView: FSPagerView) -> Int {
        return self.imageUrls.count
    }
    
   internal func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        cell.imageView?.kf.setImage(with: URL(string:self.imageUrls[index]), placeholder: slideImagePlaceholder, options: nil, progressBlock: nil, completionHandler: nil)
        cell.imageView?.contentMode = .scaleAspectFill
        cell.imageView?.clipsToBounds = true
        if  self.titles == nil {
        return cell
        } else {
            cell.textLabel?.text = self.titles?[index]
        return cell
        }
    }
    
    internal func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        pagerView.deselectItem(at: index, animated: true)
        pagerView.scrollToItem(at: index, animated: true)
        self.pageControl.currentPage = index
    }
    
    internal func pagerViewDidScroll(_ pagerView: FSPagerView) {
        guard self.pageControl.currentPage != pagerView.currentIndex else {
            return
        }
        self.pageControl.currentPage = pagerView.currentIndex
    }
}

