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
        return searchResult?.results[indexPath.row]
    }

    func fetchSearchDataForKey(_ key: String = "", completion: @escaping () -> Void) {
        let apiURLString = Constants.apiURL.rawValue + key.replacingSpacesWithPlus()
        guard let apiURL = URL(string: apiURLString) else {
            fatalError(Constants.Errors.invalidURLError.rawValue)
        }
        APIHelper.shared.fetchData(apiURL: apiURL) { [weak self] (searchResult: SearchResult?) in
            self?.searchResult = searchResult
            completion()
        }
    }
}

// MARK: Testing - DO NOT CALL ELSEWHERE
extension SearchResultsViewModel {
    func mockSearchResults() {
        searchResult = SearchResult(
            resultCount: 3,
            results: [
                SearchItem(
                    artistName: "Taylor Swift",
                    collectionPrice: 12.99,
                    country: "USA",
                    primaryGenreName: "Pop",
                    artworkUrl100: "https://example.com/taylor_swift.jpg"
                ),
                SearchItem(
                    artistName: "Ed Sheeran",
                    collectionPrice: 10.99,
                    country: "UK",
                    primaryGenreName: "Pop",
                    artworkUrl100: "https://example.com/ed_sheeran.jpg"
                ),
                SearchItem(
                    artistName: "Adele",
                    collectionPrice: 11.99,
                    country: "UK",
                    primaryGenreName: "Soul",
                    artworkUrl100: "https://example.com/adele.jpg"
                )
            ]
        )
    }
}
