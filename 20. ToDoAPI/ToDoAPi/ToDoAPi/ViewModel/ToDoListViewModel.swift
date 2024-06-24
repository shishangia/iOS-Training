//
//  ToDoListViewModel.swift
//  ToDoAPi
//
//  Created by Shivam Shishangia on 14/06/24.
//

import Foundation

class ToDoListViewModel {
    private var toDoList: [ToDo] = []
}

extension ToDoListViewModel {
    func getToDoListCount() -> Int {
        return toDoList.count
    }

    func getTodoItemAt(_ indexPath: IndexPath) -> ToDo {
        return toDoList[indexPath.row]
    }

    func fetchData(completion: @escaping () -> Void) {
        guard let apiURL = URL(string: Constants.apiURL.rawValue) else {
            fatalError(Constants.Errors.invalidURLError.rawValue)
        }
        APIHelper.shared.fetchToDoData(model: [ToDo].self,
                                       apiURL: apiURL) { [weak self] toDoList in
            if let toDoList = toDoList {
                self?.toDoList = toDoList
                completion()
            }
        }
    }
}
