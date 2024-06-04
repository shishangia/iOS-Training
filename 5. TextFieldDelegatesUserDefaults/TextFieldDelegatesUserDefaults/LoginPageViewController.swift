//
//  LoginPageViewController.swift
//  TextFieldDelegatesUserDefaults
//
//  Created by Shivam Shishangia on 28/05/24.
//

import UIKit

class ValidateEmail {
    static let shared = ValidateEmail()

    private init () {}

    func isValidEmail(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
}

class LoginPageViewController: UIViewController {

    @IBOutlet weak var invalidEmailLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        invalidEmailLabel.isHidden = true
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    @IBAction func loginButtonPressed(_ sender: Any?) {
        if !ValidateEmail.shared.isValidEmail(email: emailTextField.text ?? "") {
            invalidEmailLabel.isHidden = false
            emailTextField.layer.borderColor = UIColor.red.cgColor
            emailTextField.layer.borderWidth = 1.0
            emailTextField.becomeFirstResponder()
            return
        }

        if passwordTextField.text == nil || passwordTextField.text == "" {
            passwordTextField.layer.borderColor = UIColor.red.cgColor
            passwordTextField.layer.borderWidth = 1.0
            passwordTextField.becomeFirstResponder()
            return
        }

        invalidEmailLabel.isHidden = true
        defaults.set(emailTextField.text, forKey: "email")
        defaults.set(passwordTextField.text, forKey: "password")

        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "LoginDetailsViewController")
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}

extension LoginPageViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.returnKeyType == .next {
            view.backgroundColor = .purple
            emailTextField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        } else {
            view.backgroundColor = .orange
            passwordTextField.resignFirstResponder()
            loginButtonPressed(nil)
        }
        return true
    }
}
