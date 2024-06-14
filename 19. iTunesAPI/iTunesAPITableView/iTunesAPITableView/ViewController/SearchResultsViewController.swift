//
//  SearchResultsViewController.swift
//  iTunesAPITableView
//
//  Created by Shivam Shishangia on 11/06/24.
//

import UIKit

class SearchResultsViewController: UIViewController {

    @IBOutlet weak var searchResultsTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    var searchResultsViewModel = SearchResultsViewModel()
    var searchResult: SearchResult?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupUI()
        fetchSearchItem()
    }
}

extension SearchResultsViewController {
    private func setupUI() {
        searchResultsTableView.dataSource = self
        searchResultsTableView.backgroundColor = .black
    }

    private func setupNavBar() {
        navigationItem.title = Constants.viewControllerTitle.rawValue
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }

    private func fetchSearchItem() {
        searchResultsViewModel.fetchSearchData {
            DispatchQueue.main.async {
                self.stopAnimatingAndReloadTable()
            }
        }
    }

    private func stopAnimatingAndReloadTable() {
        self.activityIndicator.stopAnimating()
        self.searchResultsTableView.reloadData()
    }
}
