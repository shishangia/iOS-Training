//
//  ChecklistItem.swift
//  ToDoApp
//
//  Created by Shivam Shishangia on 07/06/24.
//

import Foundation

struct ChecklistItem {
    var name: String
    var isComplete: Bool
    var dueDate: Date?
    var shouldRemind: Bool = false
}
