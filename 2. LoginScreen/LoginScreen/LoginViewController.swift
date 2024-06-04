//
//  LoginScreenViewController.swift
//  LoginScreen
//
//  Created by Shivam Shishangia on 22/05/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
//    func getAttributedText(_ imageName: String, _ text: String) -> NSAttributedString {
//        let imageAttachment = NSTextAttachment()
//        if let image = UIImage(systemName: imageName)?.withTintColor(.blue)
//
//        let attributedSting = NSMutableAttributedString(attachment: imageAttachment)
//        attributedSting.append(NSAttributedString(string: text))
//        return attributedSting
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Login"
        
        emailTextField.layer.cornerRadius = 15
        emailTextField.layer.borderColor = UIColor.gray.cgColor
        emailTextField.layer.borderWidth = 1
        emailTextField.clipsToBounds = true
        emailTextField.delegate = self
        
        passwordTextField.layer.cornerRadius = 15
        passwordTextField.layer.borderColor = UIColor.gray.cgColor
        passwordTextField.layer.borderWidth = 1
        passwordTextField.clipsToBounds = true
        passwordTextField.isSecureTextEntry = true
        passwordTextField.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
        self.view.setNeedsDisplay()
    }
    
    @IBAction func signupButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let signupViewController = storyboard.instantiateViewController(withIdentifier: "SignupViewController")
        self.navigationController?.pushViewController(signupViewController, animated: true)
    }

    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.blue.cgColor
        textField.textColor = .blue
    }

    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.textColor = .black
    }
}
