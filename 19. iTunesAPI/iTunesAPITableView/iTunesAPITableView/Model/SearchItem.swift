//
//  SearchItem.swift
//  iTunesAPITableView
//
//  Created by Shivam Shishangia on 11/06/24.
//

import Foundation

struct SearchItem: Codable {
    let artistName: String
    let collectionPrice: Double
    let country: String
    let primaryGenreName: String
    let artworkUrl100: String
}
