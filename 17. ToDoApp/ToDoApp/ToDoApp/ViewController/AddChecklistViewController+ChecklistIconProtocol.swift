//
//  AddChecklistViewController+ChecklistIconProtocol.swift
//  ToDoApp
//
//  Created by Shivam Shishangia on 09/06/24.
//

import UIKit

extension AddChecklistViewController: ChecklistIconProtocol {
    func setIconPreviewImage(_ checklist: ChecklistIcon = .none) {
        checklistIcon = checklist
        iconPreviewImage.image = checklist.image
    }
}
