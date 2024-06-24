//
//  Category.swift
//  HomeRentalApp
//
//  Created by Shivam Shishangia on 10/06/24.
//

import UIKit

struct Category {
    var name: String
    var image: UIImage?

    static func generateMock() -> [Category] {
        return [
            Category(name: "Rooms for Rent", image: UIImage(systemName: "questionmark.folder")),
            Category(name: "Rooms for Rent", image: UIImage(systemName: "questionmark.folder")),
            Category(name: "Rooms for Rent", image: UIImage(systemName: "questionmark.folder")),
            Category(name: "Rooms for Rent", image: UIImage(systemName: "questionmark.folder")),
            Category(name: "Rooms for Rent", image: UIImage(systemName: "questionmark.folder")),
            Category(name: "Rooms for Rent", image: UIImage(systemName: "questionmark.folder")),
            Category(name: "Rooms for Rent", image: UIImage(systemName: "questionmark.folder")),
            Category(name: "Rooms for Rent", image: UIImage(systemName: "questionmark.folder")),
            Category(name: "Rooms for Rent", image: UIImage(systemName: "questionmark.folder"))
        ]
    }
}
