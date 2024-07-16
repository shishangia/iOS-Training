//
//  Property.swift
//  SwiftUIHomeRentalApp
//
//  Created by Shivam Shishangia on 08/07/24.
//

import Foundation

struct Property: Hashable {
    var price: Int
    var bedroom: Int
    var bathroom: Int
    var address: String
    var image: String = "Image"

    static func generateMock() -> [Property] {
        return [
            Property(price: 10000, bedroom: 2, bathroom: 2, address: "Suite 168 35301 Carlos Place"),
            Property(price: 20000, bedroom: 3, bathroom: 2, address: "670 Will Spring, Lake Christianebury"),
            Property(price: 90000, bedroom: 4, bathroom: 4, address: "Suite 806 5148 Lowe Freeway"),
            Property(price: 8000, bedroom: 1, bathroom: 1, address: "Suite 532 892 Williamson Fork")
        ]
    }
}
