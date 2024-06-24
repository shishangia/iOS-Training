//
//  UserListViewController+UITableViewDataSource.swift
//  APIJSONParsingTabViewController
//
//  Created by Shivam Shishangia on 18/06/24.
//

import UIKit

extension UserListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userListViewModel.userDetailCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.ReuseIdentifiers.userListTable.rawValue,
                                                       for: indexPath) as? UserListTableViewCell else {
            fatalError(Constants.Errors.cellDequeueError.rawValue)
        }
        let userDetail = userListViewModel.getuserDetailAt(indexPath)
        cell.configure(using: userDetail)
        return cell
    }
}
