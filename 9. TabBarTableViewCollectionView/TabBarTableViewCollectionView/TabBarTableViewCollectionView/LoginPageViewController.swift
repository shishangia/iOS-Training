//
//  LoginPageViewController.swift
//  TabBarTableViewCollectionView
//
//  Created by Shivam Shishangia on 31/05/24.
//

import UIKit

class LoginPageViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }

    @IBAction func loginButtonPressed(_ sender: Any?) {
        guard validateTextField(emailTextField, validation: Validate.shared.validateEmail) else { return }
        guard validateTextField(passwordTextField, validation: Validate.shared.validatePassword) else { return }
        
        defaults.set(emailTextField.text, forKey: "email")
        defaults.set(passwordTextField.text, forKey: "password")
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "TabBarController")
        navigationController?.pushViewController(nextViewController, animated: true)
    }

    private func validateTextField(_ textField: UITextField, validation: (String) -> Bool) -> Bool {
        if let text = textField.text, validation(text) {
            textField.layer.borderColor = UIColor.lightGray.cgColor
            textField.layer.borderWidth = 0.25
            return true
        } else {
            textField.layer.borderColor = UIColor.red.cgColor
            textField.layer.borderWidth = 1.0
            textField.becomeFirstResponder()
            return false
        }
    }
}

extension LoginPageViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        let _ = validateTextField(textField, validation: textField.returnKeyType == .next
                                  ? Validate.shared.validateEmail
                                  : Validate.shared.validatePassword)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.returnKeyType == .next {
            emailTextField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        } else {
            passwordTextField.resignFirstResponder()
            loginButtonPressed(nil)
        }
        return true
    }
}

class Validate {
    static let shared = Validate()
    
    private init() {}
    
    func validateEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }

    func validatePassword(_ password: String) -> Bool {
        return password != ""
    }
}
