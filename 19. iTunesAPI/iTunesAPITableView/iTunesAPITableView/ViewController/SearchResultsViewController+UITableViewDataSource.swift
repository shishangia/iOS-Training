//
//  SearchResultsViewController+UITableView.swift
//  iTunesAPITableView
//
//  Created by Shivam Shishangia on 11/06/24.
//

import UIKit

// MARK: Extension conforming to UITableViewDataSource
extension SearchResultsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResultsViewModel.searchResultCount()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.tableViewCellReuseIdentifier.rawValue, for: indexPath) as? SearchResultTableViewCell else {
            fatalError(Constants.Errors.cellDequeueError.rawValue)
        }
        if let searchItem = searchResultsViewModel.getSearchItemAt(indexPath) {
            cell.configure(using: searchItem)
        }
        return cell
    }
}
