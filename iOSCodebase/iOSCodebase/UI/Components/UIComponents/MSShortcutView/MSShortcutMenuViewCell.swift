//
//  MSShortcutMenuViewCell.swift
//  iOSAppTemplateSwift
//
//  Created by xiongyongjie on 18/12/2017.
//  Copyright © 2017 MonsterTechStudio. All rights reserved.
//

import UIKit

class MSShortcutMenuViewCell: UITableViewCell {
    static let cellHeight: CGFloat = 100
    static let reusedCellID = "MSShortcutMenuViewCell"
    var entryTapped:(Int)->() = { index in }
    
//    init(menuItems:[MenuItemInfo], reuseIdentifier: String = MSShortcutMenuViewCell.reusedCellID){
//       super.init(style: .default, reuseIdentifier: reuseIdentifier)
//        self.selectionStyle = .none
//        let itemWidth = UIScreen.main.bounds.size.width / CGFloat(menuItems.count)
//        for (index,menuItemInfo) in menuItems.enumerated() {
//            let leftMargin = CGFloat(index) * itemWidth
//            let itemSize = CGSize(width: itemWidth, height: MSShortcutMenuViewCell.cellHeight)
//            let menuItem = MSMenuItem(menuItemInfo: menuItemInfo, size: itemSize)
//            addSubview(menuItem)
//            menuItem.snp.makeConstraints({ (make) in
//                make.left.equalTo(leftMargin)
//                make.top.equalTo(contentView)
//                make.width.equalTo(itemWidth)
//                make.height.equalTo(MSShortcutMenuViewCell.cellHeight)
//            })
//            menuItem.tag = index
//            menuItem.addTarget(self, action: #selector(self.menuItemTapped(sender:)), for: .touchUpInside)
//        }
//
//    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func menuItemTapped(sender:UIView) {
        entryTapped(sender.tag)
        print(sender.tag)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

 
}
