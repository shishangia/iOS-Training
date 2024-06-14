//
//  Constants.swift
//  ToDoAPi
//
//  Created by Shivam Shishangia on 14/06/24.
//

import Foundation

enum Constants: String {
    case apiURL = "https://jsonplaceholder.typicode.com/todos"
    case viewControllerTitle = "ToDo List"
    case tableViewCellReuseIdentifier = "ToDoTableViewCell"

    enum Errors: String {
        case invalidURLError = "Invalid URL"
        case fetchDataError = "Could not fetch data"
        case error = "Error: "
        case cellDequeueError = "Could not dequeue cell"
    }
}
