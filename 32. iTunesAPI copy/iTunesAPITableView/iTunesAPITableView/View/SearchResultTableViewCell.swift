//
//  SearchResultTableViewCell.swift
//  iTunesAPITableView
//
//  Created by Shivam Shishangia on 11/06/24.
//

import UIKit

class SearchResultTableViewCell: UITableViewCell {

    // MARK: UI Components
    let albumArtImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "music.note.list"))
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let artistNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let genreLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [artistNameLabel, genreLabel])
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .systemBlue
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: Lifecycle methods
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Private Helpers
extension SearchResultTableViewCell {
    private func setupUI() {
        self.backgroundColor = .black
        
        self.addSubview(albumArtImageView)
        self.addSubview(stackView)
        self.addSubview(priceLabel)
        
        albumArtImageView.setBorder(borderWidth: 0.75, borderColor: UIColor.white.cgColor)

        priceLabel.setBorder(borderWidth: 1, borderColor: UIColor.systemBlue.cgColor)
        priceLabel.layer.cornerRadius = 5
        priceLabel.layer.masksToBounds = true
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            albumArtImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            albumArtImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            albumArtImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            albumArtImageView.heightAnchor.constraint(equalToConstant: 45),
            albumArtImageView.widthAnchor.constraint(equalToConstant: 45),
            
            stackView.leadingAnchor.constraint(equalTo: albumArtImageView.trailingAnchor, constant: 15),
            stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            artistNameLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            artistNameLabel.topAnchor.constraint(equalTo: stackView.topAnchor),
            artistNameLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            
            genreLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            genreLabel.topAnchor.constraint(equalTo: artistNameLabel.bottomAnchor),
            genreLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            genreLabel.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
            
            priceLabel.leadingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 15),
            priceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            priceLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            priceLabel.heightAnchor.constraint(equalToConstant: 30),
            priceLabel.widthAnchor.constraint(equalToConstant: 60),
        ])
    }
}

// MARK: Public Functions
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
