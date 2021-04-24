//
//  GFReposVC.swift
//  GF_test1
//
//  Created by Abdusalom Hojiev on 3/26/21.
//  Copyright © 2021 Abdusalom Hojiev. All rights reserved.
//

import UIKit


class GFReporVC: GFUserInfoVC {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
    }
    
    
    private func configure() {
        
        itemInfoViewOne.set(iteminfoType: .repos, withCound: user.publicRepos)
        itemInforViewTwo.set(iteminfoType: .gists, withCound: user.publicGists)
        actionButton.set(backgroungColor: .systemPurple, title: "GitHub Profile")
    }

}
