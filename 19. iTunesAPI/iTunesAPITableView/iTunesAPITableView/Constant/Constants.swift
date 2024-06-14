//
//  Constants.swift
//  iTunesAPITableView
//
//  Created by Shivam Shishangia on 12/06/24.
//

import Foundation

struct Constants {
    static let apiURL = "https://itunes.apple.com/search?term=a"
    static let viewControllerTitle = "Search Results"
    static let buttonTitle = "Free"
    static let tableViewCellReuseIdentifier = "SearchResultTableViewCell"

    struct Errors {
        static let invalidURLError = "Invalid URL"
        static let fetchDataError = "Could not fetch data"
        static let error = "Error: "
        static let cellDequeueError = "Could not dequeue cell"
    }
}
