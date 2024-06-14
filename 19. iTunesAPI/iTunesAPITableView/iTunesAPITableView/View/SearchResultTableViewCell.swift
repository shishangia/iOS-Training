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
        albumArtImageView.setBorder(borderWidth: 0.75, borderColor: UIColor.white.cgColor)

        priceLabel.setBorder(borderWidth: 1, borderColor: UIColor.systemBlue.cgColor)
        priceLabel.layer.cornerRadius = 5
        priceLabel.layer.masksToBounds = true
    }
}

extension SearchResultTableViewCell {
    func configure(using searchItem: SearchItem) {
        artistNameLabel.text = searchItem.artistName
        genreLabel.text = "\(searchItem.primaryGenreName) -- \(searchItem.country)"
        priceLabel.text = searchItem.collectionPrice == 0.0 ? Constants.buttonTitle.rawValue : "$\(searchItem.collectionPrice)"
        if let albumArtURL = URL(string: searchItem.artworkUrl100) {
            albumArtImageView.fetchAndSetImage(from: albumArtURL)
        }
    }
}
