//
//  ChecklistItemViewController+UITableView.swift
//  ToDoApp
//
//  Created by Shivam Shishangia on 07/06/24.
//

import UIKit

extension ChecklistItemViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return checklistItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItemTableViewCell", for: indexPath) as? ChecklistItemTableViewCell else {
            fatalError()
        }
        cell.checkmarkImage.isHidden = !checklistItems[indexPath.row].isComplete
        cell.nameLabel.text = checklistItems[indexPath.row].name
        return cell
    }
}

extension ChecklistItemViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        checklistItems[indexPath.row].isComplete.toggle()
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}
