//
//  APIHelper.swift
//  ToDoAPi
//
//  Created by Shivam Shishangia on 12/06/24.
//

import Alamofire

class APIHelper {
    static let shared = APIHelper()

    private init() {}

    func fetchToDoData<T: Decodable>(model: T.Type, apiURL: URL, completion: @escaping (T?) -> Void) {
        AF.request(apiURL).response { response in
            guard let data = response.data else {
                fatalError(Constants.Errors.fetchDataError.rawValue)
            }
            do {
                let apiData = try JSONDecoder().decode(T.self, from: data)
                completion(apiData)
            } catch {
                completion(nil)
            }
        }
    }
}
