//
//  SearchResultsViewController+UITableView.swift
//  iTunesAPITableView
//
//  Created by Shivam Shishangia on 11/06/24.
//

import UIKit

extension SearchResultsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResult?.resultCount ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.tableViewCellReuseIdentifier, for: indexPath) as? SearchResultTableViewCell else {
            fatalError(Constants.Errors.cellDequeueError)
        }
        if let searchItem = searchResult?.results[indexPath.row] {
            cell.artistNameLabel.text = searchItem.artistName
            cell.genreLabel.text = "\(searchItem.primaryGenreName) -- \(searchItem.country)"
            cell.priceLabel.text = searchItem.collectionPrice == 0.0 ? Constants.buttonTitle : "$\(searchItem.collectionPrice)"
            if let albumArtURL = URL(string: searchItem.artworkUrl100) {
                APIHelper.shared.fetchAlbumArt(from: albumArtURL) { image in
                    DispatchQueue.main.async {
                        if tableView.indexPath(for: cell) == indexPath {
                            cell.albumArtImageView.image = image
                        }
                    }
                }
            }
        }
        return cell
    }
}
