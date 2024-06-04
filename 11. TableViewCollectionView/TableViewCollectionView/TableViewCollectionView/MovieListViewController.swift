//
//  MovieListViewController.swift
//  TableViewCollectionView
//
//  Created by Shivam Shishangia on 04/06/24.
//

import UIKit

class MovieListViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var category: MovieCategory!
    var filteredMovies: [Movie] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        self.navigationItem.title = category.categoryName
        filteredMovies = category.movies
        searchBar.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension MovieListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredMovies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieListTableViewCell", for: indexPath) as? MovieListTableViewCell else {
            fatalError("Error reusing cell")
        }
        cell.label.text = filteredMovies[indexPath.row].movieName
        cell.movieImageView.image = filteredMovies[indexPath.row].movieImage
        cell.movieImageView.layer.cornerRadius = 50
        cell.movieImageView.layer.masksToBounds = true
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let nextViewController = storyboard.instantiateViewController(withIdentifier: "MovieDetailViewController") as? MovieDetailViewController else {
            fatalError("Cannot instantiate VC")
        }

        nextViewController.movie = filteredMovies[indexPath.row]

        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
}

extension MovieListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredMovies = category.movies.filter{ return $0.movieName.contains(searchText) }
        tableView.reloadData()
    }

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
