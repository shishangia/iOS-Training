//
//  Person.swift
//  APIJSONParsingTabViewController
//
//  Created by Shivam Shishangia on 19/06/24.
//

import Foundation

struct Person: Codable {
    let name: String
    let height: String
    let birthYear: String
    let gender: String
    let created: String

    enum CodingKeys: String, CodingKey {
        case name
        case height
        case birthYear = "birth_year"
        case gender
        case created
    }
}
