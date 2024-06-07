//
//  PropertyListCollectionViewCell.swift
//  HomeRentalApp
//
//  Created by Shivam Shishangia on 06/06/24.
//

import UIKit

class PropertyListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var propertyImageView: UIImageView!
    @IBOutlet weak var propertyPrice: UILabel!
    @IBOutlet weak var propertyDetails: UILabel!
    @IBOutlet weak var propertyAddress: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupUI()
    }
}


extension PropertyListCollectionViewCell {
    private func setupUI() {
        self.containerView.layer.cornerRadius = 5
        self.containerView.layer.borderColor = UIColor.lightGray.cgColor
        self.containerView.layer.borderWidth = 0.25
        self.containerView.layer.masksToBounds = true
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.25
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 3
        self.layer.masksToBounds = false
    }
}
