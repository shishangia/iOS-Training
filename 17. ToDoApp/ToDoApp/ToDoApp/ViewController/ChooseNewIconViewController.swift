//
//  ChooseNewIconViewController.swift
//  ToDoApp
//
//  Created by Shivam Shishangia on 09/06/24.
//

import UIKit

class ChooseNewIconViewController: UIViewController {

    @IBOutlet weak var chooseIconTableView: UITableView!
    
    var icons: [ChecklistIcon] = ChecklistIcon.allCases
    var selectedIndex: Int = 0
    var delegate: ChecklistIconProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func viewWillDisappear(_ animated: Bool) {
        if self.isMovingFromParent {
            delegate?.setIconPreviewImage(icons[selectedIndex])
        }
        super.viewWillDisappear(animated)
    }
}

extension ChooseNewIconViewController {
    private func setupUI() {
        self.navigationItem.title = "Choose Icon"
        chooseIconTableView.dataSource = self
        chooseIconTableView.delegate = self
    }
}


