//
//  ChecklistViewController+AddChecklistProtocol.swift
//  ToDoApp
//
//  Created by Shivam Shishangia on 09/06/24.
//

import Foundation

extension ChecklistViewController: AddChecklistProtocol {
    func addChecklist(_ checklist: Checklist) {
        checklists.append(checklist)
        checklistTableView.reloadData()
    }
}
