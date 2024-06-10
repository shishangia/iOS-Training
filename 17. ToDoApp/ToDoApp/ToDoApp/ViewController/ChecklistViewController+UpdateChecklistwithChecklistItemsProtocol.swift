//
//  ChecklistViewController+UpdateChecklistwithChecklistItemsProtocol.swift
//  ToDoApp
//
//  Created by Shivam Shishangia on 09/06/24.
//

import Foundation

extension ChecklistViewController: UpdateChecklistwithChecklistItemsProtocol {
    func updateChecklistItems(_ checklistItems: [ChecklistItem], _ index: Int) {
        checklists[index].checklistItems = checklistItems
        checklistTableView.reloadData()
    }
}
