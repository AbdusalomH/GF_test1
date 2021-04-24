//
//  GFItemInfoView.swift
//  GF_test1
//
//  Created by Abdusalom Hojiev on 3/9/21.
//  Copyright © 2021 Abdusalom Hojiev. All rights reserved.
//

import UIKit

enum ItemInfoType {
    case repos, gists, followers, following
}

class GFItemInfoView: UIView {

    let symbolImage = UIImageView()
    let titleLabel  = GFTitleLabel(alighment: .left, fontSize: 14)
    let countLabel  = GFTitleLabel(alighment: .center, fontSize: 14)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        
        addSubview(symbolImage)
        addSubview(titleLabel)
        addSubview(countLabel)
        
        symbolImage.translatesAutoresizingMaskIntoConstraints = false
        
        symbolImage.contentMode = .scaleAspectFill
        symbolImage.tintColor   = .label
        
        
        
        NSLayoutConstraint.activate([
        
            symbolImage.topAnchor.constraint(equalTo: self.topAnchor),
            symbolImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            symbolImage.heightAnchor.constraint(equalToConstant: 20),
            symbolImage.widthAnchor.constraint(equalToConstant: 20),
            
            
            titleLabel.centerYAnchor.constraint(equalTo: symbolImage.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: symbolImage.trailingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 18),
            
            countLabel.topAnchor.constraint(equalTo: symbolImage.bottomAnchor, constant: 4),
            countLabel.leadingAnchor.constraint(equalTo: symbolImage.leadingAnchor),
            countLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            countLabel.heightAnchor.constraint(equalToConstant: 18)
        
        
        ])
        
        
    }
    
    func set(iteminfoType: ItemInfoType, withCound count: Int) {
        
        switch iteminfoType {
        case .repos:
            symbolImage.image = UIImage(systemName: GFSymbols.respos)
            titleLabel.text   = "Public Repos"
        case .gists:
            symbolImage.image = UIImage(systemName: GFSymbols.gists)
            titleLabel.text   = "Public Gist"
        case .followers:
            symbolImage.image = UIImage(systemName: GFSymbols.followers)
            titleLabel.text   = "Followers"
        case .following:
            symbolImage.image = UIImage(systemName: GFSymbols.following)
            titleLabel.text   = "Following"
        }
        countLabel.text       = String(count)
    }
}
