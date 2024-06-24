//
//  UserListTableViewCell.swift
//  APIJSONParsingTabViewController
//
//  Created by Shivam Shishangia on 18/06/24.
//

import UIKit

class UserListTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension UserListTableViewCell {
    func configure(using userDetail: UserDetail) {
        nameLabel.attributedText = getAttributedName(from: userDetail.name)
    }

    private func getAttributedName(from fullName: String) -> NSAttributedString {
        let nameComponents = fullName.split(separator: " ")
        let lastName = nameComponents.last ?? ""
        
        let attributedString = NSMutableAttributedString(string: fullName)
        
        if let lastNameRange = fullName.range(of: String(lastName)) {
            let nsRange = NSRange(lastNameRange, in: fullName)
            attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 17), range: nsRange)
        }

        return attributedString
    }
}
