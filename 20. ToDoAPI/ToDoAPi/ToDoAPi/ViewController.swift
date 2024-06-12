//
//  ViewController.swift
//  ToDoAPi
//
//  Created by Shivam Shishangia on 12/06/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var toDoListTableView: UITableView!

    var toDoList: [ToDo] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

extension ViewController {
    
    private func setupUI() {
        toDoListTableView.dataSource = self
        APIHelper.shared.fetchToDoData { toDoList in
            guard let toDoList = toDoList else {
                print("Error: Got no data")
                return
            }
            DispatchQueue.main.async {
                self.toDoList = toDoList
                self.toDoListTableView.reloadData()
            }
        }
    }
}

