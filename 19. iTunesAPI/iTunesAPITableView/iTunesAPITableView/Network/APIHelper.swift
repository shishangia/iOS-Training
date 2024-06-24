//
//  APIHelper.swift
//  iTunesAPITableView
//
//  Created by Shivam Shishangia on 11/06/24.
//

import UIKit

// MARK: Singleton API Class to fetch API data and image
class APIHelper {
    static let shared = APIHelper()

    fileprivate init() {}

    func fetchData<T: Decodable>(apiURL: URL?, completion: @escaping (T?) -> Void) {
        guard let apiURL = apiURL else {
            fatalError(Constants.Errors.invalidURLError.rawValue)
        }
        URLSession.shared.dataTask(with: apiURL) { data, response, error in
            guard error == nil else {
                fatalError(Constants.Errors.error.rawValue + "\(String(describing: error))")
            }

            guard let data = data else {
                fatalError(Constants.Errors.fetchDataError.rawValue)
            }

            do {
                let searchResult = try JSONDecoder().decode(T.self, from: data)
                completion(searchResult)
            } catch {
                completion(nil)
            }
        }.resume()
    }

    func fetchImage(from url: URL, completion: @escaping ((UIImage?) -> ())) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                completion(nil)
                return
            }

            guard let data = data else {
                completion(nil)
                return
            }
            let image = UIImage(data: data)
            completion(image)
        }.resume()
    }
}

class MockAPIHelper: APIHelper {
    static let mockShared = MockAPIHelper()

    private override init() {
        super.init()
    }

    override func fetchData<T: Decodable>(apiURL: URL? = nil, completion: @escaping (T?) -> Void) {

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
