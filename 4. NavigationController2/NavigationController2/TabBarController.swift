//
//  TabBarController.swift
//  NavigationController2
//
//  Created by Shivam Shishangia on 28/05/24.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

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
