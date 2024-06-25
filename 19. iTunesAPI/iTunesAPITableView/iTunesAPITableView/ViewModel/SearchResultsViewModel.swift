//
//  SearchResultsViewModel.swift
//  iTunesAPITableView
//
//  Created by Shivam Shishangia on 14/06/24.
//

import Foundation

class SearchResultsViewModel {
    private var searchResult: SearchResult?
}

// MARK: Public Functions
extension SearchResultsViewModel {
    func searchResultCount() -> Int {
        return searchResult?.resultCount ?? 0
    }
    
    func getSearchItemAt(_ indexPath: IndexPath) -> SearchItem? {
        if indexPath.row <= searchResultCount() {
            return searchResult?.results[indexPath.row]
        }
        return nil
    }

    func fetchSearchDataForKey(_ key: String = "", apiHelper: APIHelperProtocol = NetworkAPIHelper.shared, completion: @escaping () -> Void) {
        let apiURLString = Constants.apiURL.rawValue + key.replacingSpacesWithPlus()
        let apiURL = URL(string: apiURLString)
        apiHelper.fetchData(apiURL: apiURL) { [weak self] (searchResult: SearchResult?) in
            self?.searchResult = searchResult
            completion()
        }
    }
}
