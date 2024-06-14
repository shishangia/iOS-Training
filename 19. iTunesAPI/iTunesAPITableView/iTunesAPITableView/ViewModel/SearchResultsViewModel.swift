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

extension SearchResultsViewModel {
    func searchResultCount() -> Int {
        return searchResult?.resultCount ?? 0
    }
    
    func getSearchItemAt(_ indexPath: IndexPath) -> SearchItem? {
        return searchResult?.results[indexPath.row]
    }

    func fetchSearchData(completion: @escaping () -> Void) {
        guard let apiURL = URL(string: Constants.apiURL.rawValue) else {
            fatalError(Constants.Errors.invalidURLError.rawValue)
        }
        APIHelper.shared.fetchData(apiURL: apiURL) { [weak self] (searchResult: SearchResult?) in
            self?.searchResult = searchResult
            completion()
        }
    }
}
