//
//  VerifiedUserTableViewCell.swift
//  HomeRentalApp
//
//  Created by Shivam Shishangia on 06/06/24.
//

import UIKit

class VerifiedUserTableViewCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

extension VerifiedUserTableViewCell {
    private func setupUI() {
        self.containerView.layer.cornerRadius = 5
        self.containerView.layer.borderColor = UIColor.lightGray.cgColor
        self.containerView.layer.borderWidth = 0.25
        self.containerView.layer.masksToBounds = true
    }
}
