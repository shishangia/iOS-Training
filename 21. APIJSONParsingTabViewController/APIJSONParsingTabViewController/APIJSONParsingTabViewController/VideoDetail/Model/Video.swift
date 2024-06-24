//
//  Video.swift
//  APIJSONParsingTabViewController
//
//  Created by Shivam Shishangia on 19/06/24.
//

import Foundation

struct Video: Decodable {
    let title: String
    let createdAt: String
    let transcodings: [Transcoding]
    
    private enum CodingKeys: String, CodingKey {
        case title
        case createdAt = "created_at"
        case transcodings
    }
}
