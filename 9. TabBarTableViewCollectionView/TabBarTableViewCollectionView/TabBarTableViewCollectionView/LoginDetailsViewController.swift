//
//  LoginDetailsViewController.swift
//  TabBarTableViewCollectionView
//
//  Created by Shivam Shishangia on 31/05/24.
//

import UIKit

class LoginDetailsViewController: UIViewController {

    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailLabel.text = "Email: \(defaults.string(forKey: "email") ?? "")"
        passwordLabel.text = "Password: \(defaults.string(forKey: "password") ?? "")"
    }
}
