//
//  ChecklistViewController.swift
//  ToDoApp
//
//  Created by Shivam Shishangia on 07/06/24.
//

import UIKit

class ChecklistViewController: UIViewController {

    @IBOutlet weak var checklistTableView: UITableView!

    var checklists: [Checklist] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

extension ChecklistViewController {
    private func setupUI() {
        checklists = Checklist.generateMock()
        checklistTableView.dataSource = self
        checklistTableView.delegate = self
        
        let addChecklistButton = UIBarButtonItem(title: "+", style: .plain, target: self, action: #selector(addChecklistButtonTapped))
        self.navigationItem.rightBarButtonItem = addChecklistButton
    }
    
    @objc func addChecklistButtonTapped() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let addChecklistViewController = storyboard.instantiateViewController(withIdentifier: "AddChecklistViewController") as? AddChecklistViewController else {
            fatalError()
        }
        addChecklistViewController.delegate = self
        self.navigationController?.pushViewController(addChecklistViewController, animated: true)
    }
}

