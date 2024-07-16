//
//  Constants.swift
//  SwiftUIToDoAPI
//
//  Created by Shivam Shishangia on 09/07/24.
//

import Foundation

enum Constants: String {
    case apiURL = "https://jsonplaceholder.typicode.com/todos"
    
    enum Errors: String {
        case invalidURLError = "Invalid URL"
        case dataFetchError = "Failed to fetch: "
    }
}
