//
//  MealListViewController.swift
//  APIJSONParsingTabViewController
//
//  Created by Shivam Shishangia on 20/06/24.
//

import UIKit

class MealListViewController: UIViewController {

    @IBOutlet weak var mealListTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    let mealListViewModel = MealListViewModel()
    var expandedIndexPaths = Set<IndexPath>()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchData()
    }
}

extension MealListViewController {
    private func setupUI() {
        mealListTableView.dataSource = self
    }

    private func fetchData() {
        Task {
            await mealListViewModel.fetchMeals()
            DispatchQueue.main.async {
                self.stopAnimatingAndReloadTable()
            }
        }
    }

    private func stopAnimatingAndReloadTable() {
        activityIndicator.stopAnimating()
        mealListTableView.reloadData()
    }

    func toggleExpandCell(at indexPath: IndexPath) {
        if expandedIndexPaths.contains(indexPath) {
            expandedIndexPaths.remove(indexPath)
        } else {
            expandedIndexPaths.insert(indexPath)
        }
        mealListTableView.reloadRows(at: [indexPath], with: .automatic)
    }
}
