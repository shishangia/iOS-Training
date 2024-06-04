//
//  SectionView.swift
//  TableView
//
//  Created by Shivam Shishangia on 30/05/24.
//

import UIKit

class SectionView: UIView {

    var label: UILabel

    override init(frame: CGRect) {
        label = UILabel()
        label.frame = CGRect(x: 27, y: 18, width: frame.width - 54, height: 21)
        label.font = .boldSystemFont(ofSize: 18)
        super .init(frame: frame)
        self.backgroundColor = .lightGray
        self.addSubview(label)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
