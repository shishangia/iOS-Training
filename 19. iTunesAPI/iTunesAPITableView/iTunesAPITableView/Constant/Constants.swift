//
//  Constants.swift
//  iTunesAPITableView
//
//  Created by Shivam Shishangia on 12/06/24.
//

import Foundation

enum Constants: String {
    case apiURL = "https://itunes.apple.com/search?term="
    case viewControllerTitle = "Search Results"
    case buttonTitle = "Free"
    case tableViewCellReuseIdentifier = "SearchResultTableViewCell"

    enum Errors: String {
        case invalidURLError = "Invalid URL"
        case fetchDataError = "Could not fetch data"
        case error = "Error: "
        case cellDequeueError = "Could not dequeue cell"
        case testing_ItemNotFound = "Expected to find item at index "
    }
}
