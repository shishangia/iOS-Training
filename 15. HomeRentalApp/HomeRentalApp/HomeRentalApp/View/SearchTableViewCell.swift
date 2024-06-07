//
//  SearchTableViewCell.swift
//  HomeRentalApp
//
//  Created by Shivam Shishangia on 06/06/24.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var searchTextField: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension SearchTableViewCell {
    private func setupUI() {
        let attributedText = NSMutableAttributedString(string: "Search ", attributes: [.foregroundColor : UIColor.black])
        attributedText.append(NSAttributedString(string: " for property for rent", attributes: [.foregroundColor: UIColor.lightGray]))

        searchTextField.attributedPlaceholder = attributedText

        containerView.layer.cornerRadius = 25
        containerView.layer.borderColor = UIColor.lightGray.cgColor
        containerView.layer.borderWidth = 1
        containerView.layer.masksToBounds = true
    }
}
