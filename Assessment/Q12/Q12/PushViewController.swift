//
//  PushViewController.swift
//  Q12
//
//  Created by Shivam Shishangia on 03/06/24.
//

import UIKit

class PushViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func popViewConroller(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
