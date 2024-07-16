//
//  Category.swift
//  SwiftUIHomeRentalApp
//
//  Created by Shivam Shishangia on 08/07/24.
//

import Foundation

struct Category: Hashable {
    var name: String
    var image: String = "questionmark.folder"

    static func generateMock() -> [Category] {
        return (1...9).map { Category(name: "Rooms for Rent \($0)") }
    }
}
