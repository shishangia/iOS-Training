//
//  ViewController.swift
//  Q16A
//
//  Created by Shivam Shishangia on 03/06/24.
//

import UIKit

struct Car {
    var name: String
    var price: Int
    var year: Int
}

struct CarMaker {
    var name: String
    var cars: [Car]
}

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!

    var carMakers: [CarMaker] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        carMakers = generateData()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }

    private func generateData() -> [CarMaker] {
        return [
            CarMaker(name: "Honda", cars: [
                Car(name: "Accord", price: 30000, year: 2024),
                Car(name: "City", price: 20000, year: 2023),
                Car(name: "Civic", price: 10000, year: 2022)]),
            CarMaker(name: "Totota", cars: [
                Car(name: "Camry", price: 28000, year: 2022),
                Car(name: "Corolla", price: 18000, year: 2024)])]
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return carMakers.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carMakers[section].cars.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Popular \(carMakers[section].name) cars"
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let car = carMakers[indexPath.section].cars[indexPath.row]
        cell.textLabel?.text = car.name
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedCar = carMakers[indexPath.section].cars[indexPath.row]
        let alert = UIAlertController(title: selectedCar.name, message: "Name: \(selectedCar.name)\nPrice: $\(selectedCar.price)\nYear: \(selectedCar.year)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

