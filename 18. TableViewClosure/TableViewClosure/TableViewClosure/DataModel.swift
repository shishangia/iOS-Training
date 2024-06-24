//
//  DataModel.swift
//  TableViewClosure
//
//  Created by Shivam Shishangia on 10/06/24.
//

import Foundation

struct Car {
    var model: String
    var price: Int
    var year: Int

    static func generateMock() -> [Car] {
        return [
            Car(model: "Toyota Camry", price: 24000, year: 2021),
            Car(model: "Honda Accord", price: 26000, year: 2020),
            Car(model: "Ford Mustang", price: 35000, year: 2022),
            Car(model: "Chevrolet Malibu", price: 22000, year: 2019),
            Car(model: "Tesla Model 3", price: 40000, year: 2023),
            Car(model: "BMW 3 Series", price: 45000, year: 2021),
            Car(model: "Audi A4", price: 42000, year: 2020),
            Car(model: "Mercedes-Benz C-Class", price: 47000, year: 2022),
            Car(model: "Hyundai Elantra", price: 20000, year: 2018),
            Car(model: "Nissan Altima", price: 23000, year: 2021)
        ]
    }
}
