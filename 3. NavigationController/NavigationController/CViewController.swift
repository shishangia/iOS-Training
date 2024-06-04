//
//  CViewController.swift
//  NavigationController
//
//  Created by Shivam Shishangia on 24/05/24.
//

import UIKit

class CViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!

    var delegate: PassBackProtocol?
    var labelData: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "C View Controller"
        self.label.text = self.labelData
    }

    @IBAction func sendForwardButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let nextViewController = storyboard.instantiateViewController(withIdentifier: "DViewController") as? DViewController else {
            print("Error initializing ViewController")
            return
        }
        nextViewController.labelData = "Previous Screen data: \(self.textField.text ?? "")"

        nextViewController.closure = { [weak self] text in
            self?.label.text = "Previous Screen data: \(text ?? "")"
        }

        self.navigationController?.pushViewController(nextViewController, animated: true)
    }

    @IBAction func sendBackwardsButtonPressed(_ sender: Any) {
        self.delegate?.setLabelValue(self.textField.text)
        self.navigationController?.popViewController(animated: true)
    }
}
