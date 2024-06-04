//
//  TableViewViewController.swift
//  TabBarTableViewCollectionView
//
//  Created by Shivam Shishangia on 31/05/24.
//

import UIKit

struct Data {
    let data: String
    var isSelected: Bool = false
    var image: UIImage?
}

class TableViewViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var data: [Data] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        generateData()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func generateData() {
        for i in 1...20 {
            data.append(Data(data: String(i)))
        }
    }
}

extension TableViewViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row].isSelected
                                ? "Hello selected \(data[indexPath.row].data)"
                                : data[indexPath.row].data
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let _ = tableView.cellForRow(at: indexPath) else {
            return
        }
        data[indexPath.row].isSelected.toggle()
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}

