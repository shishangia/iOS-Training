//
//  LoginPageViewController.swift
//  HomeRentalApp
//
//  Created by Shivam Shishangia on 06/06/24.
//

import UIKit

class LoginPageViewController: UIViewController {

    @IBOutlet weak var termsAndConditionsLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

extension LoginPageViewController {
    private func setupUI() {
        let lightGrayAttribute: [NSAttributedString.Key: Any] = [
            .foregroundColor : UIColor.lightGray,
            .font : UIFont.systemFont(ofSize: 12)]
        let blueAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.systemBlue,
            .font: UIFont.systemFont(ofSize: 13)]
        
        let attributedText = NSMutableAttributedString(string: "By logging in I agree to the ", attributes: lightGrayAttribute)
        attributedText.append(NSAttributedString(string: "Terms and Conditions ", attributes: blueAttributes))
        attributedText.append(NSAttributedString(string: "and ", attributes: lightGrayAttribute))
        attributedText.append(NSAttributedString(string: "Privacy Policy", attributes: blueAttributes))
        
        termsAndConditionsLabel.attributedText = attributedText
    }
}
