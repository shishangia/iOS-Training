//
//  ViewController.swift
//  Q15
//
//  Created by Shivam Shishangia on 03/06/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!

    let picker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
    }

    @IBAction func chooseImageButtonPressed(_ sender: Any) {
        let alertController = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)

        alertController.addAction(UIAlertAction(title: "Gallery", style: .default) { [weak self] _ in
               self?.openGallery()
        })

        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        self.present(alertController, animated: true)
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

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else {
            print("Could not load image")
            return
        }
        imageView.image = image
        picker.dismiss(animated: true, completion: nil)
    }
}

