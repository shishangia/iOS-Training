//
//  HomePageViewController.swift
//  HomeRentalApp
//
//  Created by Shivam Shishangia on 06/06/24.
//

import UIKit

class HomePageViewController: UIViewController {
    
    @IBOutlet weak var homeContentTableView: UITableView!
    
    var categories: [Category] = []
    var properties: [Property] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        homeContentTableView.dataSource = self
        categories = Mock.generateCategories()
        properties = Mock.generateProperties()
        homeContentTableView.reloadData()
    }
}
