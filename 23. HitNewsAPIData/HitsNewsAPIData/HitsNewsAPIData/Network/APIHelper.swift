//
//  APIHelper.swift
//  HitsNewsAPIData
//
//  Created by Shivam Shishangia on 25/06/24.
//

import Foundation

class APIHelper {
    static let shared = APIHelper()
    
    private init() {}
    
    func fetchData<T: Decodable>(urlString: String?) async throws -> T? {
        guard let apiURL = getAPIURL(from: urlString) else {
            print(Constants.Errors.InvalidURLError.rawValue)
            return nil
        }

        let (data, response) = try await URLSession.shared.data(from: apiURL)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        let decodedResult = try JSONDecoder().decode(T.self, from: data)
        return decodedResult
    }

    func getAPIURL(from urlString: String?) -> URL? {
        if let urlString = urlString,
           let apiURL = URL(string: urlString) {
            return apiURL
        }
        return nil
    }
}
