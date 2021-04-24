//
//  AlertVC.swift
//  GF_test1
//
//  Created by Abdusalom Hojiev on 2/8/21.
//  Copyright © 2021 Abdusalom Hojiev. All rights reserved.
//

import UIKit

class GFAlertVC: UIViewController {
    
    
    let containerView   = UIView()
    let titleLabel      = GFTitleLabel(alighment: .center, fontSize: 20)
    let bodyLabel       = GFBodyLabel(alighment: .center)
    let buttonGF        = GFButton()
    
    let padding: CGFloat = 20
    
    var alertTitle: String?
    var messageLabel: String?
    var buttonTitle: String?
    
    init(title: String, message: String, buttonTitle: String) {
        super.init(nibName: nil, bundle: nil)
        
        self.alertTitle     = title
        self.messageLabel   = message
        self.buttonTitle    = buttonTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.75)
        
        createAlertContrainer()
        createTitleLabel()
        
        createButtonLabel()
        createBodyLabel()
        
    }
    
    func createAlertContrainer() {
        
        view.addSubview(containerView)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.layer.cornerRadius    = 16
        containerView.layer.borderWidth     = 2
        containerView.layer.borderColor     = UIColor.white.cgColor
        containerView.backgroundColor       = .systemBackground

        NSLayoutConstraint.activate([
            
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 280),
            containerView.heightAnchor.constraint(equalToConstant: 220)
            

        ])
    }
    
    func createTitleLabel() {
        containerView.addSubview(titleLabel)
        
        titleLabel.text = alertTitle ?? "Something went wrong"
        
        NSLayoutConstraint.activate([
        
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 28)

        ])
    }
    
    func createBodyLabel() {
           
           containerView.addSubview(bodyLabel)
           
            bodyLabel.text          = messageLabel ?? "ин сообщение омданашам мумкин нее инчова"
            bodyLabel.numberOfLines = 4
           
           NSLayoutConstraint.activate([
           
               bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
               bodyLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
               bodyLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
               bodyLabel.bottomAnchor.constraint(equalTo: buttonGF.topAnchor, constant: -12)
           ])
       }
    
    func createButtonLabel() {
        
        containerView.addSubview(buttonGF)
        buttonGF.setTitle(buttonTitle, for: .normal)
        buttonGF.addTarget(self, action: #selector(dissmisVC), for: .touchUpInside)
        buttonGF.backgroundColor = .systemPink
        
        NSLayoutConstraint.activate([
 
            buttonGF.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -12),
            buttonGF.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            buttonGF.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            buttonGF.heightAnchor.constraint(equalToConstant: 44)

        ])
 
    }

    @objc func dissmisVC() {
        dismiss(animated: true)
    }

}
