//
//  FollowerCell.swift
//  GF_test1
//
//  Created by Abdusalom Hojiev on 2/18/21.
//  Copyright © 2021 Abdusalom Hojiev. All rights reserved.
//

import UIKit

class FollowerCell: UICollectionViewCell {
    
    static let reuseID = "FollowerCell"
    
    let avatarImage = GFAvatarImageView(frame: .zero)
    let userName = GFTitleLabel(alighment: .center, fontSize: 16)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(follower: Follower) {
        
        userName.text = follower.login
        avatarImage.dowloandImage(imageUrl: follower.avatarUrl)
        
    }
    
    
    private func configure() {
        
        let padding: CGFloat = 8
        
        addSubview(avatarImage)
        addSubview(userName)
        
        NSLayoutConstraint.activate([
        
            avatarImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            avatarImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            avatarImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            avatarImage.heightAnchor.constraint(equalTo: avatarImage.widthAnchor),
            
            
            userName.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 12),
            userName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            userName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            userName.heightAnchor.constraint(equalToConstant: 20)

        ])
 
    }
  
}
