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

    func fetchData<T: Decodable>(apiURL: URL) async throws -> T? {
        let (data, response) = try await URLSession.shared.data(from: apiURL)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }

        let decodedResult = try JSONDecoder().decode(T.self, from: data)
        return decodedResult
    }

    func fetchImage(from url: URL) async throws -> UIImage? {
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        let image = UIImage(data: data)
        return image
    }
}
