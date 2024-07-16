//
//  SearchResultsViewController+UIScrollViewDelegate.swift
//  iTunesAPITableView
//
//  Created by Shivam Shishangia on 18/06/24.
//

import UIKit

// MARK: Extension conforming to UIScrollViewDelegate
extension SearchResultsViewController: UITableViewDelegate, UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        searchBar.resignFirstResponder()
    }
}
