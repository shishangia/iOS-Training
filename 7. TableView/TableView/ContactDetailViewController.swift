//
//  ContactDetailViewController.swift
//  TableView
//
//  Created by Shivam Shishangia on 29/05/24.
//

import UIKit

class ContactDetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!

    var contactData: ContactData?

    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = "Name: \(contactData?.name ?? "")"
        ageLabel.text = "Age: \(contactData?.age ?? 0)"
    }
}
