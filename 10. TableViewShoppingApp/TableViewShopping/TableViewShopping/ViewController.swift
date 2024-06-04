//
//  ViewController.swift
//  TableViewShopping
//
//  Created by Shivam Shishangia on 31/05/24.
//

import UIKit

struct ProductData {
    var productImage: UIImage?
    var productName: String
    var productPrice: Int
    var productDescription: String
}

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var data: [ProductData] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        data = generateData()
        tableView.dataSource = self
    }

    private func generateData() -> [ProductData] {
        return [
        ProductData(productName: "Product 1", productPrice: 100, productDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
        ProductData(productName: "Product 2", productPrice: 900, productDescription: "Lorem ipsum dolor sit amet."),
        ProductData(productName: "Product 3", productPrice: 200, productDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."),
        ProductData(productName: "Product 4", productPrice: 1100, productDescription: "Lorem ipsum dolor sit amet."),
        ProductData(productName: "Product 5", productPrice: 500, productDescription: "Lorem ipsum dolor sit amet."),
        ProductData(productName: "Product 6", productPrice: 300, productDescription: "Lorem ipsum dolor sit amet."),
        ProductData(productName: "Product 7", productPrice: 800, productDescription: "Lorem ipsum dolor sit amet."),
        ProductData(productName: "Product 8", productPrice: 200, productDescription: "Lorem ipsum dolor sit amet."),
        ProductData(productName: "Product 9", productPrice: 900, productDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."),
        ProductData(productName: "Product 10", productPrice: 1000, productDescription: "Lorem ipsum dolor sit amet.")
        ]
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else {
            print("Error fetching Cells")
            return TableViewCell()
        }
        let productData = data[indexPath.row]
        if let image = productData.productImage {
            cell.productImage.image = image
        }
        cell.productNameLabel.text = productData.productName
        cell.productPriceLabel.text = "$ \(productData.productPrice)"
        cell.productDescriptionLabel.text = productData.productDescription
        return cell
    }
    
    
}

