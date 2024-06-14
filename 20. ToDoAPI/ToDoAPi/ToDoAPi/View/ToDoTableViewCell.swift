//
//  ToDoTableViewCell.swift
//  ToDoAPi
//
//  Created by Shivam Shishangia on 12/06/24.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension ToDoTableViewCell {
    func configure(with toDoItem: ToDo) {
        titleLabel.text = toDoItem.title
    }
}
