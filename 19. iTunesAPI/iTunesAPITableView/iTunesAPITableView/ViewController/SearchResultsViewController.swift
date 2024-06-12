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

    var searchResult: SearchResult?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchSearchItem()
    }
}

extension SearchResultsViewController {
    private func setupUI() {
        searchResultsTableView.dataSource = self
    }

    private func fetchSearchItem() {
        APIHelper.shared.fetchSearchResult { [weak self] result in
            DispatchQueue.main.async {
                self?.activityIndicator.stopAnimating()
                self?.searchResult = result
                self?.searchResultsTableView.reloadData()
            }
        }
    }
}
