//
//  GFFollowerVC.swift
//  GF_test1
//
//  Created by Abdusalom Hojiev on 3/26/21.
//  Copyright © 2021 Abdusalom Hojiev. All rights reserved.
//

import UIKit


class GFFOllowerVC: GFUserInfoVC {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
    }
    
    private func configure() {
        
        itemInfoViewOne.set(iteminfoType: .followers, withCound: user.followers)
        itemInforViewTwo.set(iteminfoType: .following, withCound: user.following)
        actionButton.set(backgroungColor: .systemGreen, title: "Get Followers")
    }
}
