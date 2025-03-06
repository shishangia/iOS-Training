//
//  SearchResultsViewController.swift
//  iTunesAPITableView
//
//  Created by Shivam Shishangia on 11/06/24.
//

import UIKit
import MBProgressHUD

class SearchResultsViewController: UIViewController {

    // MARK: IBOutlets
    @IBOutlet weak var searchResultsTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchOnlineSwitch: UISwitch!

    // MARK: Variables
    var searchResultsViewModel = SearchResultsViewModel()

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
    }

    private func setupNavBar() {
        navigationItem.title = Constants.viewControllerTitle.rawValue
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }

    private func stopAnimatingAndReloadTable() {
        MBProgressHUD.hide(for: self.view, animated: true)
        self.searchResultsTableView.reloadData()
    }
}

// MARK: Internal Function
extension SearchResultsViewController {
    func fetchSearchItems(for key: String = "") {
        let apiManager: APIHelperProtocol = searchOnlineSwitch.isOn ? NetworkAPIHelper.shared : OfflineAPIHelper.shared
        searchResultsViewModel.fetchSearchDataForKey(key, apiHelper: apiManager) {
            DispatchQueue.main.async {
                self.stopAnimatingAndReloadTable()
            }
        }
    }
}
