//
//  OfflineAPIHelper.swift
//  iTunesAPITableView
//
//  Created by Shivam Shishangia on 25/06/24.
//

import Foundation

// MARK: Singleton API Class for offline data and testing
class OfflineAPIHelper: APIHelperProtocol {
    static let shared = OfflineAPIHelper()

    private init() {}

    func fetchData<T: Decodable>(apiURL: URL? = nil, completion: @escaping (T?) -> Void) {
        let searchResult = SearchResult(
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

        completion(searchResult as? T)
    }
}
