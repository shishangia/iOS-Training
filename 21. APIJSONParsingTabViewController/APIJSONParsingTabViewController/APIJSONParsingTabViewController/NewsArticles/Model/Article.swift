//
//  Article.swift
//  APIJSONParsingTabViewController
//
//  Created by Shivam Shishangia on 19/06/24.
//

import Foundation

struct Article: Codable {
    let source: Source
    let author: String?
    let title: String
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String?
}
