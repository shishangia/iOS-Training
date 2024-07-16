//
//  CollectionViewCell.swift
//  CollectionView
//
//  Created by Shivam Shishangia on 13/07/24.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    private let label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CollectionViewCell {
    private func setupUI() {
        addSubview(label)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
    
    private func getBackgroundColor(for number: Int) -> UIColor {
        if (number % 3 == 0) && (number % 5 == 0) {
            return .red
        } else if number % 3 == 0 {
            return .green
        } else if number % 5 == 0 {
            return .blue
        }
        return .gray
    }
}

extension CollectionViewCell {
    func configure(data: CollectionViewData) {
        label.text = String(data.number)
        self.backgroundColor = data.isSelected ? .black : getBackgroundColor(for: data.number)
    }
}
