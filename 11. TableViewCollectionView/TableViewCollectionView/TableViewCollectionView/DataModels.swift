//
//  DataModels.swift
//  TableViewCollectionView
//
//  Created by Shivam Shishangia on 04/06/24.
//

import UIKit

struct MovieCategory {
    let categoryName: String
    let movies: [Movie]
}

struct Movie {
    let movieName: String
    var movieImage: UIImage?
}

class Mock {
    static func generateMovieData() -> [MovieCategory] {
        return [
            MovieCategory(categoryName: "Category 1", movies: [
                Movie(movieName: "Movie 1", movieImage: UIImage(named: "Image")),
                Movie(movieName: "Movie 2", movieImage: UIImage(named: "Image")),
                Movie(movieName: "Movie 3", movieImage: UIImage(named: "Image")),
                Movie(movieName: "Movie 4", movieImage: UIImage(named: "Image")),
                Movie(movieName: "Movie 5", movieImage: UIImage(named: "Image")),
                Movie(movieName: "Movie 6", movieImage: UIImage(named: "Image")),
                Movie(movieName: "Movie 7", movieImage: UIImage(named: "Image")),
                Movie(movieName: "Movie 8", movieImage: UIImage(named: "Image")),
                Movie(movieName: "Movie 9", movieImage: UIImage(named: "Image"))
            ]),
            MovieCategory(categoryName: "Category 2", movies: [
                Movie(movieName: "Movie 1", movieImage: UIImage(named: "Image")),
                Movie(movieName: "Movie 2", movieImage: UIImage(named: "Image")),
                Movie(movieName: "Movie 3", movieImage: UIImage(named: "Image")),
                Movie(movieName: "Movie 4", movieImage: UIImage(named: "Image")),
                Movie(movieName: "Movie 5", movieImage: UIImage(named: "Image")),
                Movie(movieName: "Movie 6", movieImage: UIImage(named: "Image")),
                Movie(movieName: "Movie 7", movieImage: UIImage(named: "Image")),
                Movie(movieName: "Movie 8", movieImage: UIImage(named: "Image"))
            ])
        ]
    }
}
