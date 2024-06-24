//
//  TranscodingTableViewCell.swift
//  APIJSONParsingTabViewController
//
//  Created by Shivam Shishangia on 19/06/24.
//

import UIKit

class TranscodingTableViewCell: UITableViewCell {

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

extension TranscodingTableViewCell {
    func configure(using transcoding: Transcoding) {
        idLabel.text = Constants.LabelPrefix.id.rawValue + transcoding.id
        titleLabel.text = Constants.LabelPrefix.title.rawValue + transcoding.title
        heightLabel.text = Constants.LabelPrefix.height.rawValue + String(transcoding.height)
    }
}
