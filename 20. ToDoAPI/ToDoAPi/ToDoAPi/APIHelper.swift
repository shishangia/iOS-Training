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

    func fetchToDoData(completion: @escaping ([ToDo]?) -> Void) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos") else {
            fatalError("Invalid URL")
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                fatalError("Error: \(error.localizedDescription)")
            }
            guard let data = data else {
                fatalError("Could not fetch data")
            }

            do {
                let apiData = try JSONDecoder().decode([ToDo].self, from: data)
                let incompleteTasks = apiData.filter { $0.completed }
                completion(incompleteTasks)
            } catch {
                fatalError("Cannot decode data")
            }
        }.resume()
    }
}
