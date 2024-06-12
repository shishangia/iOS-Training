//
//  ViewController+UITableView.swift
//  ToDoAPi
//
//  Created by Shivam Shishangia on 12/06/24.
//

import UIKit

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoTableViewCell", for: indexPath) as? ToDoTableViewCell else {
            fatalError()
        }
        cell.titleLabel.text = toDoList[indexPath.row].title
        return cell
    }
}
