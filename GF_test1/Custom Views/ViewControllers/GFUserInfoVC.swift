//
//  GFUserInfoVC.swift
//  GF_test1
//
//  Created by Abdusalom Hojiev on 3/9/21.
//  Copyright © 2021 Abdusalom Hojiev. All rights reserved.
//

import UIKit

class GFUserInfoVC: UIViewController {
    
    
    var user: User!
    
    init(user: User) {
        super.init(nibName: nil, bundle: nil)
        self.user = user
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let stackView           = UIStackView()
    let itemInfoViewOne     = GFItemInfoView()
    let itemInforViewTwo    = GFItemInfoView()
    let actionButton        = GFButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureController()
        layoutUI()
        configureStackView()

    }
    
    func configureController() {
        
        view.backgroundColor    = .secondarySystemBackground
        view.layer.cornerRadius = 18
    }
    
    private func configureStackView() {
        
        stackView.axis          = .horizontal
        stackView.distribution  = .equalSpacing
        stackView.spacing       = 5
        
        stackView.addArrangedSubview(itemInfoViewOne)
        stackView.addArrangedSubview(itemInforViewTwo)
  
    }
    
    func layoutUI() {
        
        view.addSubview(stackView)
        view.addSubview(actionButton)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let padding: CGFloat = 20
        
        NSLayoutConstraint.activate([
        
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            stackView.heightAnchor.constraint(equalToConstant: 50),
            
            actionButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding),
            actionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            actionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            actionButton.heightAnchor.constraint(equalToConstant: 44)

        ])
    }
}
