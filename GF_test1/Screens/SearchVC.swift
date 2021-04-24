//
//  SearchVC.swift
//  GF_test1
//
//  Created by Abdusalom Hojiev on 2/4/21.
//  Copyright © 2021 Abdusalom Hojiev. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {
    
    let imageLogo = UIImageView()
    let usernameTexfield = GFTextfield()
    let actionButton = GFButton(backgroundColor: .systemGreen, title: "Search")
    
    var isTextfieldEmpty: Bool { return !usernameTexfield.text!.isEmpty }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        createImageLogo()
        createTextfield()
        createSearchButton()
        dismissKeydoard()
        SearchButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)

    }
    
    func SearchButton() {
        actionButton.addTarget(self, action: #selector(goToFollowersList), for: .touchUpInside)
    }
    
    @objc func goToFollowersList() {
        guard isTextfieldEmpty else {
            presentGFalertOnMainThread(title: "Тайтл кушода шав", message: "тексти ошибка омадми?", buttonTitle:"OK")
            return
        }
        let followers = FolowersListVC()
        followers.username = usernameTexfield.text
        followers.title = usernameTexfield.text
        navigationController?.pushViewController(followers, animated: true)
    }

    func dismissKeydoard() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }

    func createImageLogo() {
        
        view.addSubview(imageLogo)
        imageLogo.translatesAutoresizingMaskIntoConstraints = false
        imageLogo.image = UIImage(named: "gh-logo")
        
        NSLayoutConstraint.activate([
            imageLogo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            imageLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageLogo.heightAnchor.constraint(equalToConstant: 200),
            imageLogo.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func createTextfield() {
        
        view.addSubview(usernameTexfield)
        usernameTexfield.delegate = self
        NSLayoutConstraint.activate([
            usernameTexfield.topAnchor.constraint(equalTo: imageLogo.bottomAnchor, constant: 40),
            usernameTexfield.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            usernameTexfield.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            usernameTexfield.heightAnchor.constraint(equalToConstant: 50)

        ])
    }
    
    func createSearchButton() {
        view.addSubview(actionButton)
        NSLayoutConstraint.activate([
            actionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            actionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            actionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            actionButton.heightAnchor.constraint(equalToConstant: 50)

        ])
    }
}

extension SearchVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        goToFollowersList()
        return true
    }
}
