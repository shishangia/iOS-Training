//
//  LoginViewController.swift
//  XCTests1
//
//  Created by Shivam Shishangia on 07/06/24.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func loginButtonPressed(_ sender: Any) {
        if isUsernameValid(usernameTextField.text) && isPasswordValid(passwordTextField.text) {
            // Code to move to next ViewController
        }
    }
}

extension LoginViewController {
    func isUsernameValid(_ username: String?) -> Bool {
        if let username = username {
            return username.count <= 8 && username.rangeOfCharacter(from: CharacterSet.alphanumerics.inverted) == nil
        }
        return false
    }

    func isPasswordValid(_ password: String?) -> Bool {
        if let password = password {
            return password.count >= 8 && password.count <= 12
        }
        return false
    }
}
