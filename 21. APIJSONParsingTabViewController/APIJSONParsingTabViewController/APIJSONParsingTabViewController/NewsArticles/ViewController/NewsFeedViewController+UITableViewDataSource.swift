//
//  NewsFeedViewController+UITableViewDataSource.swift
//  APIJSONParsingTabViewController
//
//  Created by Shivam Shishangia on 19/06/24.
//

import UIKit

extension NewsFeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsFeedViewModel.newsFeedCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.ReuseIdentifiers.newsFeedTable.rawValue,
                                                       for: indexPath) as? NewsFeedTableViewCell else {
            fatalError(Constants.Errors.cellDequeueError.rawValue)
        }
        if let article = newsFeedViewModel.getArticleAt(indexPath) {
            cell.configure(using: article)
        }
        return cell
    }
}
