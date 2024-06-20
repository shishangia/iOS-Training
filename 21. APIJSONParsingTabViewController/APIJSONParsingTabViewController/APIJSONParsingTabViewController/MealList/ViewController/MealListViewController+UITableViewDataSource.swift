//
//  MealListViewController+UITableViewDataSource.swift
//  APIJSONParsingTabViewController
//
//  Created by Shivam Shishangia on 20/06/24.
//

import UIKit

extension MealListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mealListViewModel.mealCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.ReuseIdentifiers.mealTable.rawValue,
                                                       for: indexPath) as? MealListTableViewCell else {
            fatalError(Constants.Errors.cellDequeueError.rawValue)
        }
        let isExpanded = expandedIndexPaths.contains(indexPath)
        if let meal = mealListViewModel.getMealAt(indexPath) {
            cell.configure(using: meal, isExpanded: isExpanded)
            cell.onToggleTapped = { [weak self] in
                self?.toggleExpandCell(at: indexPath)
            }
        }
        return cell
    }
}
