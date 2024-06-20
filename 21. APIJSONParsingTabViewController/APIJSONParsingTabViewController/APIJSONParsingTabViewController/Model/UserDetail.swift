//
//  UserDetail.swift
//  APIJSONParsingTabViewController
//
//  Created by Shivam Shishangia on 18/06/24.
//

import Foundation

struct UserDetail: Codable {
    let id: Int
    let name: String
    let username: String
    let email: String
    let address: Address
    let phone: String
    let website: String
}
