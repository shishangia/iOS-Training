//
//  SearchResult.swift
//  iTunesAPITableView
//
//  Created by Shivam Shishangia on 11/06/24.
//

import Foundation

struct SearchResult: Codable {
    let resultCount: Int
    let results: [SearchItem]
}
