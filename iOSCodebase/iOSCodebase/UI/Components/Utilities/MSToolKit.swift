//
//  MSTool.swift
//  iOSAppTemplateSwift
//
//  Created by xiongyongjie on 28/02/2018.
//  Copyright © 2018 MonsterTechStudio. All rights reserved.
//

import Foundation

class RootVCSwitcher {
    // switchRootViewController
    static func switchRootViewController(rootViewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        guard let window = UIApplication.shared.keyWindow else { return }
        if animated {
            UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: {
                let oldState: Bool = UIView.areAnimationsEnabled
                UIView.setAnimationsEnabled(false)
                window.rootViewController = rootViewController
                UIView.setAnimationsEnabled(oldState)
            }, completion: { (finished: Bool) -> () in
                if (completion != nil) {
                    completion!()
                }
            })
        } else {
            window.rootViewController = rootViewController
        }
    }
}

