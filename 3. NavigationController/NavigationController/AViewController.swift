//
//  AViewController.swift
//  NavigationController
//
//  Created by Shivam Shishangia on 23/05/24.
//

import UIKit

class AViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "A View Controller"
        self.label.text = "Previous Screen data: "
    }

    @IBAction func buttonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let nextViewController = storyboard.instantiateViewController(withIdentifier: "BViewController") as? BViewController else {
            print("Error initializing ViewController")
            return
        }
        nextViewController.labelData = "Previous Screen data: \(self.textField.text ?? "")"
        nextViewController.delegate = self
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
}

extension AViewController: PassBackProtocol {
    func setLabelValue(_ text: String?) {
        self.label.text = "Previous Screen data: \(text ?? "")"
    }
}
