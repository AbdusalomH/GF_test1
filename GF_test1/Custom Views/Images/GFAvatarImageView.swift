//
//  GFAvatarImageView.swift
//  GF_test1
//
//  Created by Abdusalom Hojiev on 2/18/21.
//  Copyright © 2021 Abdusalom Hojiev. All rights reserved.
//

import UIKit

class GFAvatarImageView: UIImageView {
    
    let placeholderImage = UIImage(named: "avatar-placeholder")
    
    let cache = NetworkManager.shared.cache

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        layer.cornerRadius  = 10
        clipsToBounds       = true
        image               = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
 
    }
    
    func dowloandImage(imageUrl: String) {
        
        let cachString = NSString(string: imageUrl)
        
        if let cache = cache.object(forKey: cachString) {
            
            self.image = cache
            return
        }
 
        guard let url = URL(string: imageUrl) else {return}
        
        let taks = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else {return}
            if error != nil {return}
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {return}
            guard let data = data else {return}
            guard let image = UIImage(data: data) else {return}
            self.cache.setObject(image, forKey: cachString)
            DispatchQueue.main.async {self.image = image}
        }
        taks.resume()
    }
}

