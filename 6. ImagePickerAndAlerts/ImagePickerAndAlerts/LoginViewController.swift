//
//  ViewController.swift
//  ImagePickerAndAlerts
//
//  Created by Shivam Shishangia on 29/05/24.
//

import UIKit

struct LoginData {
    var username: String
    var password: String
    var profilePicture: UIImage?
}

class LoginViewController: UIViewController {

    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    let picker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
    }

    @IBAction func chooseImageButtonPressed(_ sender: Any) {
        let alertController = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
        
        alertController.addAction(UIAlertAction(title: "Camera", style: .default) { [weak self] _ in
            self?.openCamera()
        })
        alertController.addAction(UIAlertAction(title: "Gallery", style: .default) { [weak self] _ in
               self?.openGallery()
        })
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        self.present(alertController, animated: true)
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        let loginData = LoginData(username: usernameTextField.text ?? "",
                                  password: passwordTextField.text ?? "",
                                  profilePicture: nil)

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "LoginDetailsViewController") as! LoginDetailsViewController
        nextViewController.loginData = loginData
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }

    func openCamera() {
        if (UIImagePickerController.isSourceTypeAvailable(.camera)) {
            picker.sourceType = .camera
            self.present(picker, animated: true)
        } else {
            let alert = UIAlertController(title: "Camera Not Available", message: "This device has no camera", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
        }
    }

    func openGallery() {
        if (UIImagePickerController.isSourceTypeAvailable(.photoLibrary)) {
            picker.sourceType = .photoLibrary
            self.present(picker, animated: true)
        } else {
            let alert = UIAlertController(title: "Gallery Not Available", message: "Photo Library is not available", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
        }
    }
}

extension LoginViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage,
              let imageData = image.jpegData(compressionQuality: 1.0) else {
            print("Could not load image")
            return
        }
        profilePicture.image = image
        UserDefaults.standard.set(imageData, forKey: "savedImage")
        picker.dismiss(animated: true, completion: nil)
    }
}
