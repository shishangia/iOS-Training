//
//  NewsFeedViewController.swift
//  APIJSONParsingTabViewController
//
//  Created by Shivam Shishangia on 19/06/24.
//

import UIKit

class NewsFeedViewController: UIViewController {

    @IBOutlet weak var newsFeedTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    let newsFeedViewModel = NewsFeedViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchData()
    }
}

extension NewsFeedViewController {
    private func setupUI() {
        newsFeedTableView.dataSource = self
    }

    private func fetchData() {
        newsFeedViewModel.fetchNewsFeed {
            DispatchQueue.main.async {
                self.stopAnimatingAndReloadTable()
            }
        }
    }

    private func stopAnimatingAndReloadTable() {
        activityIndicator.stopAnimating()
        newsFeedTableView.reloadData()
    }
}
