//
//  DViewController.swift
//  NavigationController
//
//  Created by Shivam Shishangia on 24/05/24.
//

import UIKit

class DViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    var labelData: String = ""
    var closure: ((String?) -> Void)?
    var previousDataClosure: ((String?) -> Void) = { previousButtonData in
        print("Previous Button Data: \(previousButtonData ?? "")")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "D View Controller"
        self.label.text = self.labelData
    }

    @IBAction func sendBackwardsButtonPressed(_ sender: Any) {
        self.closure?(self.textField.text)
        self.navigationController?.popViewController(animated: true)
    }
}
