//
//  ViewController.swift
//  NavigationController2
//
//  Created by Shivam Shishangia on 23/05/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.navigationController?.viewControllers.first == self {
            return
        }
        
        let backImage = UIImage(systemName: "arrow.backward")
        let backButton = UIBarButtonItem(image: backImage, style: .plain, target: self, action: #selector(backButtonTapped))

        let logoutButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutButtonTapped))
        self.navigationItem.rightBarButtonItem = logoutButton

        self.navigationItem.leftBarButtonItem = backButton
    }

    @objc func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func logoutButtonTapped() {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
