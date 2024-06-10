//
//  ChecklistItemViewController+AddChecklistItemProtocol.swift
//  ToDoApp
//
//  Created by Shivam Shishangia on 09/06/24.
//

import Foundation

extension ChecklistItemViewController: AddChecklistItemProtocol {
    func addChecklistItem(_ checklistItem: ChecklistItem) {
        checklistItems.append(checklistItem)
        checklistItemsTableView.reloadData()
    }
}
