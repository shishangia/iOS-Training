//
//  ToDoViewModel.swift
//  SwiftUIToDoAPI
//
//  Created by Shivam Shishangia on 09/07/24.
//

import Foundation

class ToDoViewModel: ObservableObject {
    @Published var toDoList: [ToDo] = []
}

extension ToDoViewModel {
    func fetchToDoData() async {
        guard let apiURL = URL(string: Constants.apiURL.rawValue) else {
            fatalError(Constants.Errors.invalidURLError.rawValue)
        }
        
        do {
            if let toDoList: [ToDo] = try await APIHelper.shared.fetchData(apiURL: apiURL) {
                self.toDoList = toDoList
            }
        } catch {
            print(Constants.Errors.dataFetchError.rawValue + error.localizedDescription)
        }
    }
}
