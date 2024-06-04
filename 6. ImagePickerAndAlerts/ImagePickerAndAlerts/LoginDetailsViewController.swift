//
//  LoginDetailsViewController.swift
//  ImagePickerAndAlerts
//
//  Created by Shivam Shishangia on 29/05/24.
//

import UIKit

class LoginDetailsViewController: UIViewController {

    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    var loginData: LoginData?
    
    override func viewDidLoad() {
        super.viewDidLoad();

        if let imageData = UserDefaults.standard.data(forKey: "savedImage"),
           let savedImage = UIImage(data: imageData) {
            profilePicture.image = savedImage
        }

        usernameLabel.text = "Username: \(loginData?.username ?? "")"
        passwordLabel.text = "Password: \(loginData?.password ?? "")"
    }
}
