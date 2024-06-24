//
//  SearchResultsViewModel.swift
//  iTunesAPITableView
//
//  Created by Shivam Shishangia on 14/06/24.
//

import Foundation

class SearchResultsViewModel {
    private var searchResult: SearchResult?
    private let apiHelper: APIHelper

    init(searchResult: SearchResult? = nil, apiHelper: APIHelper = APIHelper.shared) {
        self.searchResult = searchResult
        self.apiHelper = apiHelper
    }
}

// MARK: Public Functions
extension SearchResultsViewModel {
    func searchResultCount() -> Int {
        return searchResult?.resultCount ?? 0
    }
    
    func getSearchItemAt(_ indexPath: IndexPath) -> SearchItem? {
        return searchResult?.results[indexPath.row]
    }

    func fetchSearchDataForKey(_ key: String = "", completion: @escaping () -> Void) {
        let apiURLString = Constants.apiURL.rawValue + key.replacingSpacesWithPlus()
        let apiURL = URL(string: apiURLString)
        apiHelper.fetchData(apiURL: apiURL) { [weak self] (searchResult: SearchResult?) in
            self?.searchResult = searchResult
            completion()
        }
    }
}
