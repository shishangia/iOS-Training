//
//  DataModels.swift
//  HomeRentalApp
//
//  Created by Shivam Shishangia on 06/06/24.
//

import UIKit

struct Category {
    var name: String
    var image: UIImage?
}

struct Property {
    var price: Int
    var bedroom: Int
    var bathroom: Int
    var address: String
    var image: UIImage?
}

class Mock {
    static func generateCategories() -> [Category] {
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

    static func generateProperties() -> [Property] {
        return [
            Property(price: 10000, bedroom: 2, bathroom: 2, address: "Suite 168 35301 Carlos Place", image: UIImage(named: "Image")),
            Property(price: 20000, bedroom: 3, bathroom: 2, address: "670 Will Spring, Lake Christianebury", image: UIImage(named: "Image")),
            Property(price: 90000, bedroom: 4, bathroom: 4, address: "Suite 806 5148 Lowe Freeway", image: UIImage(named: "Image")),
            Property(price: 8000, bedroom: 1, bathroom: 1, address: "Suite 532 892 Williamson Fork", image: UIImage(named: "Image"))
        ]
    }
}

