//
//  MSScrollingPageBehaviour.swift
//  iOSAppTemplateSwift
//
//  Created by xiongyongjie on 31/01/2018.
//  Copyright © 2018 MonsterTechStudio. All rights reserved.
//

import Foundation

public enum MSScrollingPageBehaviour {
    
    case common(skipIntermediateViewControllers: Bool)
    case progressive(skipIntermediateViewControllers: Bool, elasticIndicatorLimit: Bool)
    
    public var skipIntermediateViewControllers: Bool {
        switch self {
        case .common(let skipIntermediateViewControllers):
            return skipIntermediateViewControllers
        case .progressive(let skipIntermediateViewControllers, _):
            return skipIntermediateViewControllers
        }
    }
    
    public var isProgressiveIndicator: Bool {
        switch self {
        case .common:
            return false
        case .progressive:
            return true
        }
    }
    
    public var isElasticIndicatorLimit: Bool {
        switch self {
        case .common:
            return false
        case .progressive(_, let elasticIndicatorLimit):
            return elasticIndicatorLimit
        }
    }

}
