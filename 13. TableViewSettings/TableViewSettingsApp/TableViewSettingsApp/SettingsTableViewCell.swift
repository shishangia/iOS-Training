//
//  SettingsTableViewCell.swift
//  TableViewSettingsApp
//
//  Created by Shivam Shishangia on 04/06/24.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {

    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var title: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
