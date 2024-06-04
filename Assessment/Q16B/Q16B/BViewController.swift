//
//  BViewController.swift
//  Q16B
//
//  Created by Shivam Shishangia on 03/06/24.
//

import UIKit

class BViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    var delegate: PassBackProtocol?
    var labelData: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        self.label.text = self.labelData
    }

    @IBAction func sendBackwardButtonPressed(_ sender: Any) {
        self.delegate?.setLabelValue(self.textField.text)
        self.navigationController?.popViewController(animated: true)
    }
}
