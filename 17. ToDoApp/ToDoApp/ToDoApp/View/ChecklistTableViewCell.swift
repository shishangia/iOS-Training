//
//  ChecklistTableViewCell.swift
//  ToDoApp
//
//  Created by Shivam Shishangia on 07/06/24.
//

import UIKit

class ChecklistTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
