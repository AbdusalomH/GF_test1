//
//  GFTextfield.swift
//  GF_test1
//
//  Created by Abdusalom Hojiev on 2/4/21.
//  Copyright © 2021 Abdusalom Hojiev. All rights reserved.
//

import UIKit

class GFTextfield: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        
        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGray4.cgColor
        
        textColor = .label
        tintColor = .label
        textAlignment = .center
        font = UIFont.preferredFont(forTextStyle: .title2)
        
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 12
        
        backgroundColor = .systemGroupedBackground
        autocorrectionType = .no
        placeholder = "Enter a username"
        returnKeyType = .go
        translatesAutoresizingMaskIntoConstraints = false

    }

}
