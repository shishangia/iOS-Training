//
//  ContactTableViewCell.swift
//  TableView
//
//  Created by Shivam Shishangia on 29/05/24.
//

import UIKit

class ContactTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tickImage: UIImageView!

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
