//
//  SearchResultsViewController+UISearchBarDelegate.swift
//  iTunesAPITableView
//
//  Created by Shivam Shishangia on 18/06/24.
//

import UIKit
import MBProgressHUD

// MARK: Extension conforming to UISearchBarDelegate
extension SearchResultsViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        MBProgressHUD.showAdded(to: self.view, animated: true)
        fetchSearchItems(for: searchBar.text ?? "")
    }
}
