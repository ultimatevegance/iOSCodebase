//
//  MSMenuItem.swift
//  iOSAppTemplateSwift
//
//  Created by xiongyongjie on 15/12/2017.
//  Copyright © 2017 MonsterTechStudio. All rights reserved.
//

import UIKit

struct MenuItemInfo {
    var title: String
    var imageName: String
}

class MSMenuItem: UIControl {
    let imageView = UIImageView()
    let titleLabel = UILabel()
    
    init(menuItemInfo:MenuItemInfo, size: CGSize) {
        super.init(frame: CGRect(origin: CGPoint(x: 0, y: 0) ,size: size))
        addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.height.width.equalTo(45)
            make.centerX.equalTo(self)
            make.centerY.equalTo(self).offset(-12)
        }
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(imageView.snp.bottom).offset(6)
            make.centerX.equalTo(self)
        }
        titleLabel.textColor = .black
        titleLabel.font = UIFont.systemFont(ofSize: 13)
       
        setMenuItemInfo(itemInfo: menuItemInfo)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setMenuItemInfo(itemInfo: MenuItemInfo) {
        imageView.image = UIImage(named: itemInfo.imageName)
        titleLabel.text = itemInfo.title
    }
    
}
