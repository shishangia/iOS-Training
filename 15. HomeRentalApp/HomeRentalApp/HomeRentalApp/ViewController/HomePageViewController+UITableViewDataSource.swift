//
//  HomePageViewController+UITableViewDataSource.swift
//  HomeRentalApp
//
//  Created by Shivam Shishangia on 06/06/24.
//

import UIKit

extension HomePageViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as? SearchTableViewCell else {
                fatalError()
            }
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell", for: indexPath) as? CategoryTableViewCell else {
                fatalError()
            }
            cell.categoryCollectionView.dataSource = self
            cell.categoryCollectionView.tag = indexPath.section
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "VerifiedUserTableViewCell", for: indexPath) as? VerifiedUserTableViewCell else {
                fatalError()
            }
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PropertyListTableViewCell", for: indexPath) as? PropertyListTableViewCell else {
                fatalError()
            }
            cell.propertyListCollectionView.dataSource = self
            cell.propertyListCollectionView.tag = indexPath.section
            return cell
        default:
            fatalError()
        }
    }
}
