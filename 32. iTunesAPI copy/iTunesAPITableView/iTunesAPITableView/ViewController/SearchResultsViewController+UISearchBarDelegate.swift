//
//  SearchResultsViewController+UISearchBarDelegate.swift
//  iTunesAPITableView
//
//  Created by Shivam Shishangia on 18/06/24.
//

import UIKit

// MARK: Extension conforming to UISearchBarDelegate
extension SearchResultsViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        activityIndicator.startAnimating()
        fetchSearchItems(for: searchBar.text ?? "")
    }
}
