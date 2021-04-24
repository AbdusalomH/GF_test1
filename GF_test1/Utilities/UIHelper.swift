//
//  UIHelper.swift
//  GF_test1
//
//  Created by Abdusalom Hojiev on 2/19/21.
//  Copyright © 2021 Abdusalom Hojiev. All rights reserved.
//

import UIKit


struct UIHelper {
    static func createThreeColumnFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
         
         let width                       = view.bounds.width
         let padding: CGFloat            = 12
         let minimumItemSpacing: CGFloat = 10
         let availableWidth: CGFloat     = width - (padding * 2) - (minimumItemSpacing * 2)
         let itemWidth: CGFloat          = availableWidth / 3
         let flowLayout                  = UICollectionViewFlowLayout()
         flowLayout.sectionInset         = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
         flowLayout.itemSize             = CGSize(width: itemWidth, height: itemWidth + 40)
    
         return flowLayout
     }
}
