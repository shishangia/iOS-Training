//
//  SearchResultsViewController.swift
//  iTunesAPITableView
//
//  Created by Shivam Shishangia on 11/06/24.
//

import UIKit

class SearchResultsViewController: UIViewController {

    // MARK: UI Components
    let searchOnlineLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .white
        label.text = "Search online"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let searchOnlineSwitch: UISwitch = {
        let uiswitch = UISwitch()
        uiswitch.setOn(true, animated: true)
        uiswitch.translatesAutoresizingMaskIntoConstraints = false
        return uiswitch
    }()
    
    lazy var stackView: UIView = {
        let view = UIView()
        view.addSubview(searchOnlineLabel)
        view.addSubview(searchOnlineSwitch)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search the iTunes store"
        searchBar.barStyle = .black
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    lazy var searchResultsTableView: UITableView = {
        let tableView = UITableView(frame: view.bounds)
        tableView.register(SearchResultTableViewCell.self, forCellReuseIdentifier: Constants.tableViewCellReuseIdentifier.rawValue)
        tableView.backgroundColor = .black
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = .white
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()

    // MARK: Variables
    var searchResultsViewModel = SearchResultsViewModel()

    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupUI()
        setupConstraints()
    }
}

// MARK: Private Helpers
extension SearchResultsViewController {
    private func setupNavBar() {
        navigationItem.title = Constants.viewControllerTitle.rawValue
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    private func setupUI() {
        searchResultsTableView.dataSource = self
        searchResultsTableView.delegate = self
        searchBar.delegate = self
        
        self.view.addSubview(stackView)
        self.view.addSubview(searchBar)
        self.view.addSubview(searchResultsTableView)
        self.view.addSubview(activityIndicator)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            stackView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 50),
            
            searchOnlineLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 30),
            searchOnlineLabel.centerYAnchor.constraint(equalTo: stackView.centerYAnchor),
           
            searchOnlineSwitch.leadingAnchor.constraint(equalTo: searchOnlineLabel.trailingAnchor, constant: 30),
            searchOnlineSwitch.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -30),
            searchOnlineSwitch.centerYAnchor.constraint(equalTo: stackView.centerYAnchor),
            
            searchBar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            searchBar.topAnchor.constraint(equalTo: stackView.bottomAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: 56),
 
            searchResultsTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            searchResultsTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            searchResultsTableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            searchResultsTableView.bottomAnchor.constraint(equalTo: self.view.layoutMarginsGuide.bottomAnchor),
            
            activityIndicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
    
    private func stopAnimatingAndReloadTable() {
        self.activityIndicator.stopAnimating()
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
