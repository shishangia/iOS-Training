//
//  Song.swift
//  SwiftUIListMusicApp
//
//  Created by Shivam Shishangia on 08/07/24.
//

import Foundation

struct Song: Hashable {
    var name: String
    var artist: String
    var imageName: String?
    
    static func generateSongs() -> [Song] {
        return [
            Song(name: "Nevermind", artist: "Red Hot Chilli Peppers", imageName: "Image1"),
            Song(name: "Anthony Kiedis", artist: "Remi Wolf", imageName: "Image2"),
            Song(name: "I Love Lady Gaga", artist: "77 Bombay Street", imageName: "Image3"),
            Song(name: "Anthony Kiedis", artist: "Remi Wolf", imageName: "Image2")
        ]
    }
}
