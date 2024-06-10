//
//  ChecklistItemTableViewCell.swift
//  ToDoApp
//
//  Created by Shivam Shishangia on 07/06/24.
//

import UIKit

class ChecklistItemTableViewCell: UITableViewCell {

    @IBOutlet weak var checkmarkImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
