//
//  MSPhotoGridView.swift
//  imageGridView
//
//  Created by xiongyongjie on 09/02/2018.
//  Copyright © 2018 MonsterTechStudio. All rights reserved.
//

import UIKit

class MSPhotoGridView: UIView {
    var imageUrlArray: [String] = [] {
        
        didSet {
           layoutItems(imageUrlArray: imageUrlArray)
        }
    }
    var itemTapped: (Int)->() = { index in }
    static let margin: CGFloat = 5
    
    override init(frame: CGRect) {
        super .init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public  static func getGridViewSize(imageUrlArray: [String] ) -> CGSize {
        let itemW: CGFloat = MSPhotoGridView.imageViewWidth(imageUrlArray: imageUrlArray)
        let itemH: CGFloat = itemW
        let perRowItemCount = MSPhotoGridView.itemCountPerRow(imageUrlArray: imageUrlArray)
        let gridViewWitdh: CGFloat = CGFloat(perRowItemCount) * itemW + CGFloat(perRowItemCount - 1) * margin
        let columnCount = round(Double(imageUrlArray.count / perRowItemCount))
        let gridViewHight: CGFloat = CGFloat(columnCount) * itemH + CGFloat(columnCount - 1) * margin
        return CGSize(width: gridViewWitdh, height: gridViewHight)
    }
    
    private func layoutItems(imageUrlArray: [String]) {
        for index in 1...imageUrlArray.count {
            let imageView = UIImageView()
            imageView.tag = index - 1
            imageView.contentMode = UIViewContentMode.scaleAspectFill
            imageView.clipsToBounds = true
            imageView.backgroundColor = .gray
            
            let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(itemTapped(sender:)))
            imageView.addGestureRecognizer(tapGesture)
            let perRowItemCount = MSPhotoGridView.itemCountPerRow(imageUrlArray: imageUrlArray)
            let columnIndex  = (index - 1) % perRowItemCount
            let rowIndex = (index - 1 ) / perRowItemCount
            let itemW: CGFloat = MSPhotoGridView.imageViewWidth(imageUrlArray: imageUrlArray)
            let itemH: CGFloat = itemW
            //set image with url string
            let imageUrlStrig = imageUrlArray[index - 1]
            imageView.kf.setImage(with: URL.init(string: imageUrlStrig))
            imageView.frame = CGRect(x: CGFloat(columnIndex) * (itemW + MSPhotoGridView.margin), y: CGFloat(rowIndex) * (itemH + MSPhotoGridView.margin), width: itemW, height: itemH)
            self.addSubview(imageView)
        }
    }
    
    public static  func imageViewWidth(imageUrlArray: [String]) -> CGFloat {
        if imageUrlArray.count == 1 {
            return 180
        } else {
            return 100
        }
    }
    
    public static  func itemCountPerRow(imageUrlArray: [String]) -> Int {
        if imageUrlArray.count < 4 {
            return imageUrlArray.count
        } else if imageUrlArray.count == 4 {
            return 2
        } else {
            return 3
        }
    }
    
    @objc func itemTapped(sender:UIImageView) {
        itemTapped(sender.tag)
        print(itemTapped(sender.tag))
    }
    
}
