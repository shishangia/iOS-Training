//
//  SearchResultTableViewCell.swift
//  iTunesAPITableView
//
//  Created by Shivam Shishangia on 11/06/24.
//

import UIKit

class SearchResultTableViewCell: UITableViewCell {

    @IBOutlet weak var albumArtImageView: UIImageView!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

extension SearchResultTableViewCell {
    private func setupUI() {
        albumArtImageView.layer.borderColor = UIColor.white.cgColor
        albumArtImageView.layer.borderWidth = 0.75

        priceLabel.layer.cornerRadius = 5
        priceLabel.layer.borderColor = UIColor.systemBlue.cgColor
        priceLabel.layer.borderWidth = 1
        priceLabel.layer.masksToBounds = true
    }
}
