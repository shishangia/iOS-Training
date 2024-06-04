//
//  ViewController.swift
//  TableViewCollectionView
//
//  Created by Shivam Shishangia on 04/06/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var movieCategories: [MovieCategory] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        movieCategories = Mock.generateMovieData()
    }

    private func setupUI() {
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieCategories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else {
            fatalError("Error reusing cell")
        }
        cell.label.text = movieCategories[indexPath.row].categoryName
        cell.collectionView.delegate = self
        cell.collectionView.dataSource = self
        cell.collectionView.tag = indexPath.row
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let nextViewController = storyboard.instantiateViewController(withIdentifier: "MovieListViewController") as? MovieListViewController else {
            fatalError("Cannot instantiate VC")
        }
        nextViewController.category = movieCategories[indexPath.row]
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieCategories[collectionView.tag].movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell else {
            fatalError("Error reusing cell")
        }
        let movie = movieCategories[collectionView.tag].movies[indexPath.row]
        cell.label.text = movie.movieName
        cell.imageView.image = movie.movieImage
        cell.imageView.layer.cornerRadius = 50
        cell.imageView.layer.masksToBounds = true
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let nextViewController = storyboard.instantiateViewController(withIdentifier: "MovieDetailViewController") as? MovieDetailViewController else {
            fatalError("Cannot instantiate VC")
        }

        nextViewController.movie = movieCategories[collectionView.tag].movies[indexPath.row]

        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
}
