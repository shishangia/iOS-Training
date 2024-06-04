//
//  DataModels.swift
//  TableViewMusicApp
//
//  Created by Shivam Shishangia on 04/06/24.
//

import UIKit

struct Song {
    var name: String
    var artist: String
    var image: UIImage?
}

class Mock {
    static func generateSongs() -> [Song] {
        return [
            Song(name: "Nevermind", artist: "Red Hot Chilli Peppers", image: UIImage(named: "Image1")),
            Song(name: "Anthony Kiedis", artist: "Remi Wolf", image: UIImage(named: "Image2")),
            Song(name: "I Love Lady Gaga", artist: "77 Bombay Street", image: UIImage(named: "Image3")),
            Song(name: "Anthony Kiedis", artist: "Remi Wolf", image: UIImage(named: "Image2"))
        ]
    }
}
