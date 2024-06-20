//
//  NewsFeed.swift
//  APIJSONParsingTabViewController
//
//  Created by Shivam Shishangia on 19/06/24.
//

import Foundation

struct NewsFeed: Codable {
    let totalResults: Int
    let articles: [Article]
}
