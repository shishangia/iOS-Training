//
//  NewsListViewController+UITableViewDelegate.swift
//  HitsNewsAPIData
//
//  Created by Shivam Shishangia on 25/06/24.
//

import UIKit

extension NewsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let hit = newsListViewModel.getHit(for: indexPath),
              let articleURLString = hit.url,
              let nextViewController = instantiateViewController(with: Constants.WebKitViewControllerIdentifier.rawValue) as? WebKitViewController else {
            return
        }
        
        nextViewController.articleURLString = articleURLString
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
}

extension NewsListViewController {
    private func instantiateViewController(with storyboardID: String) -> UIViewController? {
        let storyboard = UIStoryboard(name: Constants.StoryboardName.rawValue, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: storyboardID)
    }
}
