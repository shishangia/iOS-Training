//
//  ViewController.swift
//  TableView2
//
//  Created by Shivam Shishangia on 30/05/24.
//

import UIKit

struct Data {
    let data: String
    var isSelected: Bool = false
}

class ViewController: UIViewController {

    var data: [Data] = []
    var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        generateData()
        
        tableView = UITableView(frame: view.safeAreaLayoutGuide.layoutFrame)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
    }
    
    func generateData() {
        for i in 1...20 {
            data.append(Data(data: String(i)))
        }
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
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
        guard let cell = tableView.cellForRow(at: indexPath) else {
            return
        }
        data[indexPath.row].isSelected.toggle()
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}

