//
//  ChecklistViewController+UITableView.swift
//  ToDoApp
//
//  Created by Shivam Shishangia on 07/06/24.
//

import UIKit

extension ChecklistViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return checklists.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistTableViewCell", for: indexPath) as? ChecklistTableViewCell else {
            fatalError()
        }
//        cell.tag = indexPath.row
        cell.iconImageView.image = checklists[indexPath.row].icon?.image
        cell.nameLabel.text = checklists[indexPath.row].name
        return cell
    }
}

extension ChecklistViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let nextViewController = storyboard.instantiateViewController(withIdentifier: "ChecklistItemViewController") as? ChecklistItemViewController else {
            fatalError()
        }
        nextViewController.checklistItems = checklists[indexPath.row].checklistItems
        nextViewController.navigationController?.title = checklists[indexPath.row].name
        nextViewController.delegate = self
        nextViewController.view.tag = indexPath.row
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
}
