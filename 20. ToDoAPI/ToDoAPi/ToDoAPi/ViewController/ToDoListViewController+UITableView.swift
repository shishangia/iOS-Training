//
//  ToDoListViewController+UITableView.swift
//  ToDoAPi
//
//  Created by Shivam Shishangia on 12/06/24.
//

import UIKit

extension ToDoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoListViewModel.getToDoListCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.tableViewCellReuseIdentifier.rawValue,
                                                       for: indexPath) as? ToDoTableViewCell else {
            fatalError(Constants.Errors.cellDequeueError.rawValue)
        }
        let toDoItem = toDoListViewModel.getTodoItemAt(indexPath)
        cell.configure(with: toDoItem)
        return cell
    }
}
