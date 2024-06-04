//
//  SignupViewController.swift
//  LoginScreen
//
//  Created by Shivam Shishangia on 22/05/24.
//

import UIKit

class SignupViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Signup"

        nameTextField.layer.cornerRadius = 15
        nameTextField.layer.borderColor = UIColor.gray.cgColor
        nameTextField.layer.borderWidth = 1
        nameTextField.clipsToBounds = true
        nameTextField.delegate = self
        
        emailTextField.layer.cornerRadius = 15
        emailTextField.layer.borderColor = UIColor.gray.cgColor
        emailTextField.layer.borderWidth = 1
        emailTextField.clipsToBounds = true
        emailTextField.delegate = self

        phoneTextField.layer.cornerRadius = 15
        phoneTextField.layer.borderColor = UIColor.gray.cgColor
        phoneTextField.layer.borderWidth = 1
        phoneTextField.clipsToBounds = true
        phoneTextField.delegate = self

        passwordTextField.layer.cornerRadius = 15
        passwordTextField.layer.borderColor = UIColor.gray.cgColor
        passwordTextField.layer.borderWidth = 1
        passwordTextField.clipsToBounds = true
        passwordTextField.isSecureTextEntry = true
        passwordTextField.delegate = self
        
        confirmPasswordTextField.layer.cornerRadius = 15
        confirmPasswordTextField.layer.borderColor = UIColor.gray.cgColor
        confirmPasswordTextField.layer.borderWidth = 1
        confirmPasswordTextField.clipsToBounds = true
        confirmPasswordTextField.isSecureTextEntry = true
        confirmPasswordTextField.delegate = self

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
        self.view.setNeedsDisplay()
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }

    @IBAction func loginButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension SignupViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.blue.cgColor
        textField.textColor = .blue
    }

    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.textColor = .black
    }
}
