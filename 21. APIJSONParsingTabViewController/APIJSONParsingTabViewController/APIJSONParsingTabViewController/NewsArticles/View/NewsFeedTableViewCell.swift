//
//  NewsFeedTableViewCell.swift
//  APIJSONParsingTabViewController
//
//  Created by Shivam Shishangia on 19/06/24.
//

import UIKit

class NewsFeedTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var sourceAndTimeLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension NewsFeedTableViewCell {
    func configure(using article: Article) {
        titleLabel.text = article.title
        authorLabel.text = article.author
        sourceAndTimeLabel.text = article.source.name + " " + article.publishedAt
        if let imageURL = article.urlToImage,
           let thumbnailURL = URL(string: imageURL) {
            Task {
                await thumbnailImageView.fetchAndSetImage(from: thumbnailURL)
            }
        }
    }
}
