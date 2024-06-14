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
        guard let serverURL = URL(string: Constants.apiURL) else {
            fatalError(Constants.Errors.invalidURLError)
        }
        APIHelper.shared.fetchSearchResult(model: SearchResult.self, apiURL: serverURL) { [weak self] result in
            DispatchQueue.main.async {
                self?.activityIndicator.stopAnimating()
                self?.searchResult = result
                self?.searchResultsTableView.reloadData()
            }
        }
    }
}
