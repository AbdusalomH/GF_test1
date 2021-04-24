//
//  GFButton.swift
//  GF_test1
//
//  Created by Abdusalom Hojiev on 2/4/21.
//  Copyright © 2021 Abdusalom Hojiev. All rights reserved.
//

import UIKit

class GFButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    init(backgroundColor: UIColor, title: String) {
        super.init(frame: .zero)
        
        self.backgroundColor = backgroundColor
        setTitle(title, for: .normal)
        configure()
 
    }

    private func configure() {
        layer.cornerRadius = 10
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints = false
  
    }
    
    
    func set(backgroungColor: UIColor, title: String) {
        self.backgroundColor = backgroungColor
        setTitle(title, for: .normal)
    }
    
    

}