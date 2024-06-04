//
//  ViewController.swift
//  Q4
//
//  Created by Shivam Shishangia on 03/06/24.
//

import UIKit

class ViewController: UIViewController {

    var button: UIButton!
    var countLabel: UILabel!
    var count: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        countLabel = UILabel()
        countLabel.text = "Count: \(count)"
        countLabel.textAlignment = .center
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        
        button = UIButton(type: .system)
        button.setTitle("Increase count", for: .normal)
        button.addTarget(self, action: #selector(increaseCount), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(countLabel)
        view.addSubview(button)
        
        activateConstraints()
    }
    
    func activateConstraints() {
        NSLayoutConstraint.activate([
            countLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            countLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: countLabel.bottomAnchor, constant: 25)
        ])
    }

    @objc func increaseCount() {
        count = count + 1
        countLabel.text = "Count: \(count)"
    }
}

