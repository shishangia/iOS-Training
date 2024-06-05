//
//  StatesViewController.swift
//  TableViewPlist
//
//  Created by Shivam Shishangia on 05/06/24.
//

import UIKit

class StatesViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var statesTableView: UITableView!

    var stateData: [String] = []
    var filteredArray: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupData()
    }

    private func setupUI() {
        searchBar.delegate = self
        statesTableView.dataSource = self
    }

    private func setupData() {
        guard let path = Bundle.main.path(forResource: "DataPList", ofType: "plist"),
              let dataDict = NSDictionary(contentsOfFile: path),
              let data = dataDict.object(forKey: "States") as? [String] else {
            fatalError("Cannot fetch data from PList")
        }
        stateData = data
        filteredArray = stateData
    }
}

extension StatesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StateTableViewCell", for: indexPath) as? StateTableViewCell else {
            fatalError("Cannot dequeue cell")
        }
        cell.stateName.text = filteredArray[indexPath.row]
        return cell
    }
}

extension StatesViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredArray = searchText == "" ? stateData : stateData.filter{ return $0.contains(searchText) }
        statesTableView.reloadData()
    }

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

