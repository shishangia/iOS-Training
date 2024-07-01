//
//  Model.swift
//  ExpandableTableView
//
//  Created by Shivam Shishangia on 01/07/24.
//

import Foundation

struct Item {
    var title: String
    var details: [String]
    var isExpanded: Bool = false
    
    static func mock() -> [Item] {
        return [
            Item(title: "Item 1", details: ["Detail 1", "Detail 2", "Detail 3"]),
            Item(title: "Item 2", details: ["Detail 1", "Detail 2"]),
            Item(title: "Item 3", details: ["Detail 1"])
        ]
    }
}
