//
//  SearchResultsViewController.swift
//  iTunesAPITableView
//
//  Created by Shivam Shishangia on 11/06/24.
//

import UIKit

class SearchResultsViewController: UIViewController {

    // MARK: IBOutlets
    @IBOutlet weak var searchResultsTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var searchBar: UISearchBar!

    // MARK: Variables
    var searchResultsViewModel = SearchResultsViewModel()
    var searchResult: SearchResult?

    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupUI()
    }
}

// MARK: Private Helpers
extension SearchResultsViewController {
    private func setupUI() {
        searchResultsTableView.dataSource = self
        searchResultsTableView.delegate = self
        searchBar.delegate = self
        searchResultsTableView.backgroundColor = .black
        activityIndicator.stopAnimating()
    }

    private func setupNavBar() {
        navigationItem.title = Constants.viewControllerTitle.rawValue
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }

    private func stopAnimatingAndReloadTable() {
        self.activityIndicator.stopAnimating()
        self.searchResultsTableView.reloadData()
    }
}

// MARK: Internal Function
extension SearchResultsViewController {
    func fetchSearchItems(for key: String = "") {
        searchResultsViewModel.fetchSearchDataForKey(key) {
            DispatchQueue.main.async {
                self.stopAnimatingAndReloadTable()
            }
        }
    }
}
