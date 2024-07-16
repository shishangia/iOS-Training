//
//  APIHelper.swift
//  SwiftUIToDoAPI
//
//  Created by Shivam Shishangia on 09/07/24.
//
import Foundation

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
}
