//
//  MSPageIndicatorInfo.swift
//  iOSAppTemplateSwift
//
//  Created by xiongyongjie on 31/01/2018.
//  Copyright © 2018 MonsterTechStudio. All rights reserved.
//

import Foundation
import UIKit

public struct MSPageIndicatorInfo {
    public var title: String?
    public var image: UIImage?
    public var highlightedImage: UIImage?
    public var userInfo: Any?
    // init with only titles
    public init(title: String?) {
        self.title = title
    }
    // init with only images
    public init(image: UIImage?, highlightedImage: UIImage? = nil, userInfo: Any? = nil) {
        self.image = image
        self.highlightedImage = highlightedImage
    }
    // init with title and images
    public init(title: String?, image: UIImage?, highlightedImage: UIImage? = nil, userInfo: Any? = nil) {
        self.title = title
        self.image = image
        self.highlightedImage = highlightedImage
    }
}

extension MSPageIndicatorInfo : ExpressibleByStringLiteral {
    
    public init(stringLiteral value: String) {
        title = value
    }
    
    public init(extendedGraphemeClusterLiteral value: String) {
        title = value
    }
    
    public init(unicodeScalarLiteral value: String) {
        title = value
    }
}
