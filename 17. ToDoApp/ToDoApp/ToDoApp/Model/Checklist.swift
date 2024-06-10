//
//  Checklist.swift
//  ToDoApp
//
//  Created by Shivam Shishangia on 07/06/24.
//

import UIKit

struct Checklist {
    var name: String
    var icon: ChecklistIcon?
    var checklistItems: [ChecklistItem]

    static func generateMock() -> [Checklist] {

        func createDate(year: Int, month: Int, day: Int) -> Date? {
            var dateComponents = DateComponents()
            dateComponents.year = year
            dateComponents.month = month
            dateComponents.day = day
            return Calendar.current.date(from: dateComponents)
        }

        let checklistItems1 = [
            ChecklistItem(name: "Buy milk", isComplete: false, dueDate: createDate(year: 2024, month: 6, day: 15)),
            ChecklistItem(name: "Buy eggs", isComplete: true, dueDate: nil),
            ChecklistItem(name: "Buy bread", isComplete: false, dueDate: createDate(year: 2024, month: 6, day: 14))
        ]

        let checklistItems2 = [
            ChecklistItem(name: "Dentist appointment", isComplete: false, dueDate: createDate(year: 2024, month: 7, day: 1)),
            ChecklistItem(name: "Call mom", isComplete: false, dueDate: createDate(year: 2024, month: 6, day: 12))
        ]

        let checklistItems3 = [
            ChecklistItem(name: "Finish homework", isComplete: true, dueDate: createDate(year: 2024, month: 6, day: 10)),
            ChecklistItem(name: "Clean room", isComplete: false, dueDate: nil)
        ]

        let checklistItems4 = [
            ChecklistItem(name: "John's birthday gift", isComplete: false, dueDate: createDate(year: 2024, month: 8, day: 20)),
            ChecklistItem(name: "Send birthday card", isComplete: true, dueDate: createDate(year: 2024, month: 8, day: 18))
        ]
        
        let checklistItems5 = [
            ChecklistItem(name: "Book flight tickets", isComplete: false, dueDate: createDate(year: 2024, month: 9, day: 1)),
            ChecklistItem(name: "Reserve hotel", isComplete: false, dueDate: createDate(year: 2024, month: 9, day: 5))
        ]

        return [
            Checklist(name: "Grocery List", icon: .grocery, checklistItems: checklistItems1),
            Checklist(name: "Appointments", icon: .appointment, checklistItems: checklistItems2),
            Checklist(name: "Chores", icon: .chore, checklistItems: checklistItems3),
            Checklist(name: "Birthdays", icon: .birthday, checklistItems: checklistItems4),
            Checklist(name: "Travel Plans", icon: .trip, checklistItems: checklistItems5)
        ]
    }
}


enum ChecklistIcon: CaseIterable {
    case none
    case appointment
    case birthday
    case chore
    case drink
    case folder
    case grocery
    case inbox
    case photo
    case trip

    var label: String {
        switch self {
        case .none:
            return "No Icon"
        case .appointment:
            return "Appointment"
        case .birthday:
            return "Birthday"
        case .chore:
            return "Chore"
        case .drink:
            return "Drink"
        case .folder:
            return "Folder"
        case .grocery:
            return "Grocery"
        case .inbox:
            return "Inbox"
        case .photo:
            return "Photo"
        case .trip:
            return "Trip"
        }
    }

    var image: UIImage? {
        switch self {
        case .none:
            return nil
        case .appointment:
            return UIImage(systemName: "deskclock")
        case .birthday:
            return UIImage(systemName: "gift")
        case .chore:
            return UIImage(systemName: "cooktop")
        case .drink:
            return UIImage(systemName: "mug")
        case .folder:
            return UIImage(systemName: "folder")
        case .grocery:
            return UIImage(systemName: "cart")
        case .inbox:
            return UIImage(systemName: "tray.and.arrow.down")
        case .photo:
            return UIImage(systemName: "camera")
        case .trip:
            return UIImage(systemName: "airplane")
        }
    }
}
