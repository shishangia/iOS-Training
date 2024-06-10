//
//  ChooseIconTableViewCell.swift
//  ToDoApp
//
//  Created by Shivam Shishangia on 09/06/24.
//

import UIKit

class ChooseIconTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var iconNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
