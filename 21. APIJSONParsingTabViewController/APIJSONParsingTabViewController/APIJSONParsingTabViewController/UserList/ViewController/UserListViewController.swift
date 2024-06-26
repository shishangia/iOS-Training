//
//  UserListViewController.swift
//  APIJSONParsingTabViewController
//
//  Created by Shivam Shishangia on 18/06/24.
//

import UIKit

class UserListViewController: UIViewController {

    @IBOutlet weak var userListTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    let userListViewModel = UserListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchData()
    }
}

extension UserListViewController {
    private func setupUI() {
        userListTableView.dataSource = self
        self.navigationItem.title = Constants.userListViewControllerTitle.rawValue
    }

    private func fetchData() {
        Task {
            await userListViewModel.fetchUserDetails()
            DispatchQueue.main.async {
                self.stopAnimatingAndReloadTable()
            }
        }
    }

    private func stopAnimatingAndReloadTable() {
        activityIndicator.stopAnimating()
        userListTableView.reloadData()
    }
}
