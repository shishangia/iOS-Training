//
//  StateTableViewCell.swift
//  TableViewPlist
//
//  Created by Shivam Shishangia on 05/06/24.
//

import UIKit

class StateTableViewCell: UITableViewCell {

    @IBOutlet weak var stateName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
