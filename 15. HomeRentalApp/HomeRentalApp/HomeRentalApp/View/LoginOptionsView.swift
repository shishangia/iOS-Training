//
//  LoginOptionsView.swift
//  HomeRentalApp
//
//  Created by Shivam Shishangia on 07/06/24.
//

import UIKit

class LoginOptionsView: UIView {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupUI()
    }
}

extension LoginOptionsView {
    private func setupUI() {
        self.layer.cornerRadius = 5
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 0.5
        self.layer.masksToBounds = true
    }
}
