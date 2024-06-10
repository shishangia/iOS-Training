//
//  TableDetailViewController.swift
//  TableViewClosure
//
//  Created by Shivam Shishangia on 10/06/24.
//

import UIKit

class TableDetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!

    var setCarDataClosure: ((Car) -> ())?
    
    var carData: Car?

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setCarDataClosure = { [weak self] car in
            self?.carData = car
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = carData?.model
        priceLabel.text = carData.map { "$ \($0.price)" } ?? ""
        yearLabel.text = carData.map { "\($0.year)" } ?? ""
    }
}
