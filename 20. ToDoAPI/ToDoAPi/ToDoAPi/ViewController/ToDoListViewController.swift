//
//  ToDoListViewController.swift
//  ToDoAPi
//
//  Created by Shivam Shishangia on 12/06/24.
//

import UIKit

class ToDoListViewController: UIViewController {

    @IBOutlet weak var toDoListTableView: UITableView!

    var toDoListViewModel = ToDoListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

extension ToDoListViewController {
    
    private func setupUI() {
        self.navigationItem.title = Constants.viewControllerTitle.rawValue
        toDoListTableView.dataSource = self
        toDoListViewModel.fetchData {
            DispatchQueue.main.async {
                self.toDoListTableView.reloadData()
            }
        }
    }
}

