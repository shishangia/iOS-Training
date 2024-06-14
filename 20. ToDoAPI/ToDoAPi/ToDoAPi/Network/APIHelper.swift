//
//  APIHelper.swift
//  ToDoAPi
//
//  Created by Shivam Shishangia on 12/06/24.
//

import Foundation

class APIHelper {
    static let shared = APIHelper()

    private init() {}

    func fetchToDoData<T: Decodable>(model: T.Type, apiURL: URL, completion: @escaping (T?) -> Void) {
        URLSession.shared.dataTask(with: apiURL) { data, response, error in
            guard error == nil else {
                fatalError(Constants.Errors.error.rawValue + "\(String(describing: error))")
            }

            guard let data = data else {
                fatalError(Constants.Errors.fetchDataError.rawValue)
            }

            do {
                let apiData = try JSONDecoder().decode(T.self, from: data)
                completion(apiData)
            } catch {
                completion(nil)
            }
        }.resume()
    }
}
