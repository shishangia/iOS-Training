//
//  APIHelper.swift
//  APIJSONParsingTabViewController
//
//  Created by Shivam Shishangia on 18/06/24.
//

import UIKit

class APIHelper {
    static let shared = APIHelper()
    
    private init() {}
    
    func fetchData<T: Decodable>(apiURL: URL, completion: @escaping (T?) -> Void) {
        URLSession.shared.dataTask(with: apiURL) { data, response, error in
            guard error == nil else {
                fatalError(Constants.Errors.error.rawValue + "\(String(describing: error))")
            }
            
            guard let data = data else {
                fatalError(Constants.Errors.fetchDataError.rawValue)
            }
            
            do {
                let decodedResult = try JSONDecoder().decode(T.self, from: data)
                completion(decodedResult)
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
