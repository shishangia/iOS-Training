//
//  NewsListViewController.swift
//  HitsNewsAPIData
//
//  Created by Shivam Shishangia on 25/06/24.
//

import UIKit

class NewsListViewController: UIViewController {

    @IBOutlet weak var newsListTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    let newsListViewModel = NewsListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchData()
    }
}

extension NewsListViewController {
    private func setupUI() {
        newsListTableView.dataSource = self
        newsListTableView.delegate = self
    }

    private func fetchData() {
        Task {
            await newsListViewModel.fetchNewsData()
            DispatchQueue.main.async {
                self.stopAnimatingAndReloadTable()
            }
        }
    }

    private func stopAnimatingAndReloadTable() {
        activityIndicator.stopAnimating()
        newsListTableView.reloadData()
    }
}
