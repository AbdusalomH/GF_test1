//
//  UserInfoControllerVC.swift
//  GF_test1
//
//  Created by Abdusalom Hojiev on 3/3/21.
//  Copyright © 2021 Abdusalom Hojiev. All rights reserved.
//

import UIKit

class UserInfoControllerVC: UIViewController {
    
    var avatarImageView = GFAvatarImageView(frame: .zero)
    var usernameLabel = GFTitleLabel(alighment: .left, fontSize: 34)
    var nameLabel = GFSecondaryTitleLabel(fontSize: 18)
    var locationImageView = UIImageView()
    var locationLabel = GFSecondaryTitleLabel(fontSize: 18)
    var bioLabel = GFBodyLabel(alighment: .left)

    var userInfo: User!
    

    init(userInfo: User) {
        super.init(nibName: nil, bundle: nil)
        self.userInfo = userInfo
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createSubviews()
        layoutUI()
        configureElements()
        
    }
    
    func configureElements() {
        
        avatarImageView.dowloandImage(imageUrl: userInfo.avatarUrl)
        
        usernameLabel.text          = userInfo.login
        nameLabel.text              = userInfo.name ?? ""
        locationImageView.image     = UIImage(systemName: GFSymbols.location)
        locationLabel.text          = userInfo.location ?? "No Location"
        bioLabel.text               = userInfo.bio ?? "No bio available"
        bioLabel.numberOfLines      = 3

    }
    
    
    func createSubviews(){
        
        view.addSubview(avatarImageView)
        view.addSubview(usernameLabel)
        view.addSubview(nameLabel)
        view.addSubview(locationImageView)
        view.addSubview(locationLabel)
        view.addSubview(bioLabel)
    }
    
    func layoutUI() {
        
        let padding: CGFloat = 20
        let textImagePadding: CGFloat = 12
        
        locationImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            avatarImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            avatarImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            avatarImageView.heightAnchor.constraint(equalToConstant: 90),
            avatarImageView.widthAnchor.constraint(equalToConstant: 90),
            
            usernameLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor),
            usernameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: textImagePadding),
            usernameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            usernameLabel.heightAnchor.constraint(equalToConstant: 38),
            
            nameLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: textImagePadding),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            
            locationImageView.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor),
            locationImageView.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: textImagePadding),
            locationImageView.heightAnchor.constraint(equalToConstant: 20),
            locationImageView.widthAnchor.constraint(equalToConstant: 20),
            
            locationLabel.centerYAnchor.constraint(equalTo: locationImageView.centerYAnchor),
            locationLabel.leadingAnchor.constraint(equalTo: locationImageView.trailingAnchor, constant: 5),
            locationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            locationLabel.heightAnchor.constraint(equalToConstant: 20),
            
            bioLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: padding),
            bioLabel.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor),
            bioLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            bioLabel.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}
