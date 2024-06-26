//
//  NewsListViewController+UITableViewDataSource.swift
//  HitsNewsAPIData
//
//  Created by Shivam Shishangia on 25/06/24.
//

import UIKit

extension NewsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsListViewModel.getNewsDataCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableViewDequeIdentifier.rawValue, for: indexPath) as? NewsListTableViewCell else {
            print(Constants.Errors.CellDequeueError.rawValue)
            return UITableViewCell()
        }
        if let hit = newsListViewModel.getHit(for: indexPath) {
            cell.configure(using: hit)
        }
        return cell
    }
}
