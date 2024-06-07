//
//  PropertyListCollectionViewCell.swift
//  HomeRentalApp
//
//  Created by Shivam Shishangia on 06/06/24.
//

import UIKit

class PropertyListCollectionViewCell: UICollectionViewCell {
    
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
        self.layer.cornerRadius = 5
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 0.25
        self.layer.masksToBounds = true
    }
}
