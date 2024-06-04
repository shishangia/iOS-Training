//
//  MovieDetailViewController.swift
//  TableViewCollectionView
//
//  Created by Shivam Shishangia on 04/06/24.
//

import UIKit

class MovieDetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!

    var movie: Movie!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        imageView.image = movie.movieImage
        label.text = "Movie: \(movie.movieName)"
    }
}
