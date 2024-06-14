//
//  APIHelper.swift
//  iTunesAPITableView
//
//  Created by Shivam Shishangia on 11/06/24.
//

import UIKit

class APIHelper {
    static let shared = APIHelper()

    private init() {}

    func fetchSearchResult<T: Decodable>(model: T.Type, apiURL: URL, completion: @escaping (T?) -> Void) {
        URLSession.shared.dataTask(with: apiURL) { data, response, error in
            guard error == nil else {
                fatalError(Constants.Errors.error + "\(String(describing: error))")
            }

            guard let data = data else {
                fatalError(Constants.Errors.fetchDataError)
            }

            do {
                let searchResult = try JSONDecoder().decode(T.self, from: data)
                completion(searchResult)
            } catch {
                completion(nil)
            }
        }.resume()
    }

    func fetchAlbumArt(from url: URL, completion: @escaping ((UIImage?) -> ())) {
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
