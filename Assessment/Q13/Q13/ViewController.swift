//
//  ViewController.swift
//  Q13
//
//  Created by Shivam Shishangia on 03/06/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    
    var isSelected = false

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
    }

    @IBAction func buttonPress(_ sender: Any) {
        isSelected.toggle()
        if isSelected {
            view.backgroundColor = .red
            button.setTitle("Click to change the background color to green!", for: .normal)
            return
        }
        view.backgroundColor = .green
        button.setTitle("Click to change the background color to red!", for: .normal)
    }
    
}

