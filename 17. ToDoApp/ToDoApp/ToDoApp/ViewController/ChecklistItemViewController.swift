//
//  ChecklistItemViewController.swift
//  ToDoApp
//
//  Created by Shivam Shishangia on 07/06/24.
//

import UIKit

class ChecklistItemViewController: UIViewController {

    @IBOutlet weak var checklistItemsTableView: UITableView!
    
    var checklistItems: [ChecklistItem] = []
    var delegate: UpdateChecklistwithChecklistItemsProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if self.isMovingFromParent {
            delegate?.updateChecklistItems(checklistItems, view.tag)
        }
        super.viewWillDisappear(animated)
    }
}

extension ChecklistItemViewController {
    private func setupUI() {
        checklistItemsTableView.dataSource = self
        checklistItemsTableView.delegate = self
        let addChecklistItemButton = UIBarButtonItem(title: "+", style: .plain, target: self, action: #selector(addChecklistItemButtonTapped))
        self.navigationItem.rightBarButtonItem = addChecklistItemButton
    }

    @objc func addChecklistItemButtonTapped() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let addChecklistItemViewController = storyboard.instantiateViewController(withIdentifier: "AddChecklistItemViewController") as? AddChecklistItemViewController else {
            fatalError()
        }
        addChecklistItemViewController.delegate = self
        self.navigationController?.pushViewController(addChecklistItemViewController, animated: true)
    }
}
