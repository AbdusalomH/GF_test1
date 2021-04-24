//
//  GFEmptyState.swift
//  GF_test1
//
//  Created by Abdusalom Hojiev on 2/23/21.
//  Copyright © 2021 Abdusalom Hojiev. All rights reserved.
//

import UIKit

class GFEmptyState: UIView {
    
    let messagView = GFTitleLabel(alighment: .center, fontSize: 26)
    let emptyImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(message: String) {
        super.init(frame: .zero)
        self.messagView.text = message
        configure()
    }

    func configure() {
        
        addSubview(messagView)
        addSubview(emptyImage)
        
        messagView.numberOfLines = 3
        messagView.textColor = .secondaryLabel
        
        emptyImage.image = UIImage(named: "empty-state-logo")
        emptyImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            messagView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -150),
            messagView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            messagView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            messagView.heightAnchor.constraint(equalToConstant: 200),
            
            emptyImage.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
            emptyImage.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
            emptyImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 170),
            emptyImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 20)
  
        ])
    }
}
