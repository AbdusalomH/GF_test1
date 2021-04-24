//
//  UserInfoVC.swift
//  GF_test1
//
//  Created by Abdusalom Hojiev on 2/24/21.
//  Copyright © 2021 Abdusalom Hojiev. All rights reserved.
//

import UIKit

class UserInfoVC: UIViewController {
    
    let container = UIView()
    let containerMiddle = UIView()
    let containerBottom = UIView()
    let dateLabel       = GFBodyLabel(alighment: .center)
    var username: String!
    
    
    var containers: [UIView] = []


    override func viewDidLoad() {
        super.viewDidLoad()
        configureController()
        configureContainers()
        getUserInfo()
    }
    
    func configureController() {
        view.backgroundColor = .systemBackground

        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dissmissVC))
        navigationItem.rightBarButtonItem = doneButton
    }

    
    func getUserInfo() {
        
        NetworkManager.shared.getUsersInfo(username: username) { [weak self] result in
            
            guard let self = self else {return}
            
            switch result {
                
            case .success(let user):
                DispatchQueue.main.async {
                    self.add(childVC: UserInfoControllerVC(userInfo: user), to: self.container)
                    self.add(childVC: GFReporVC(user: user), to: self.containerMiddle)
                    self.add(childVC: GFFOllowerVC(user: user), to: self.containerBottom)
                    self.dateLabel.text = "GitHub since \(user.createdAt.displayDateFormat())"
                }
                
            case .failure(let error):
                self.presentGFalertOnMainThread(title: "Something went wrong!", message: error.rawValue , buttonTitle: "Ok")
            }
        }
    }
    
    
    func configureContainers() {
        
        containers = [container, containerMiddle, containerBottom, dateLabel ]
        
        for views in containers {
            view.addSubview(views)
            views.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let padding: CGFloat        = 20
        let itemHeight: CGFloat     = 140
        

        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            container.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            container.heightAnchor.constraint(equalToConstant: 180),
            
            containerMiddle.topAnchor.constraint(equalTo: container.bottomAnchor, constant: padding),
            containerMiddle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            containerMiddle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            containerMiddle.heightAnchor.constraint(equalToConstant: itemHeight),
            
            containerBottom.topAnchor.constraint(equalTo: containerMiddle.bottomAnchor, constant: padding),
            containerBottom.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            containerBottom.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            containerBottom.heightAnchor.constraint(equalToConstant: itemHeight),
            
            dateLabel.topAnchor.constraint(equalTo: containerBottom.bottomAnchor, constant: 20),
            dateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            dateLabel.heightAnchor.constraint(equalToConstant: 20)
 
        ])
  
    }

    func add(childVC: UIViewController, to container: UIView) {
        addChild(childVC)
        container.addSubview(childVC.view)
        childVC.view.frame = container.bounds
        childVC.didMove(toParent: self)
    }
    
    @objc func dissmissVC() {
        dismiss(animated: true)
    }
}
