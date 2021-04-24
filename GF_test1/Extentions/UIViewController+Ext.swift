//
//  UIViewController+Ext.swift
//  GF_test1
//
//  Created by Abdusalom Hojiev on 2/10/21.
//  Copyright © 2021 Abdusalom Hojiev. All rights reserved.
//

import UIKit

fileprivate var container: UIView!

extension UIViewController {
    
    func presentGFalertOnMainThread(title: String, message: String, buttonTitle: String) {
        
        DispatchQueue.main.async {
        let alert = GFAlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alert.modalPresentationStyle    = .overFullScreen
            alert.modalTransitionStyle      = .crossDissolve
            self.present(alert, animated: true)
        }
    }
    
    func showAnimation() {
        
        container = UIView(frame: view.bounds)
        view.addSubview(container)
        
        container.backgroundColor   = .systemBackground
        container.alpha             = 0
        UIView.animate(withDuration: 0.25) {
            container.alpha = 0.8
        }
        
        let activateLoading = UIActivityIndicatorView(style: .large)
        container.addSubview(activateLoading)
        
        activateLoading.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            activateLoading.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activateLoading.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
            activateLoading.startAnimating()
    }
    
    func dismissAnimation() {
        DispatchQueue.main.async {
            container.removeFromSuperview()
            container = nil
        }
    }
    
    
    func emptyStateView(message:String, view: UIView) {
        
        let emptyStateImage = GFEmptyState(message: message)
            emptyStateImage.frame = view.bounds
            view.addSubview(emptyStateImage)
    }
}
