//
//  ChooseNewIconViewController+UITableView.swift
//  ToDoApp
//
//  Created by Shivam Shishangia on 09/06/24.
//

import UIKit

extension ChooseNewIconViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return icons.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ChooseIconTableViewCell", for: indexPath) as? ChooseIconTableViewCell else {
            fatalError()
        }
        cell.iconImageView.image = icons[indexPath.row].image
        cell.iconNameLabel.text = icons[indexPath.row].label
        return cell
    }
}

extension ChooseNewIconViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
    }
}
