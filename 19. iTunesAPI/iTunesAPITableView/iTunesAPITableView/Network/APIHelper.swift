//
//  APIHelper.swift
//  iTunesAPITableView
//
//  Created by Shivam Shishangia on 11/06/24.
//

import Foundation

class APIHelper {
    static let shared = APIHelper()

    private init() {}

    func fetchSearchResult(completion: @escaping ((SearchResult?) -> ())) {
        guard let serverURL = URL(string: Constants.apiURL) else {
            fatalError(Constants.Errors.invalidURLError)
        }

        URLSession.shared.dataTask(with: URLRequest(url: serverURL)) { data, response, error in
            guard error == nil else {
                fatalError(Constants.Errors.error + "\(String(describing: error))")
            }

            guard let data = data else {
                fatalError(Constants.Errors.fetchDataError)
            }

            do {
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                completion(searchResult)
            } catch {
                completion(nil)
            }
        }.resume()
    }
}
