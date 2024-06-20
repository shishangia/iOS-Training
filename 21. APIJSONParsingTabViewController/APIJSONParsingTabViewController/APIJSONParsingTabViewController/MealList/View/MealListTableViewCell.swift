//
//  MealListTableViewCell.swift
//  APIJSONParsingTabViewController
//
//  Created by Shivam Shishangia on 20/06/24.
//

import UIKit

class MealListTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var instructionLabel: UILabel!

    var isExpanded = false
    var instructionText: String = ""
    var onToggleTapped: (() -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension MealListTableViewCell {
    private func setupUI() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(seeMoreTapped))
        instructionLabel.addGestureRecognizer(tapGesture)
        instructionLabel.isUserInteractionEnabled = true
    }

    @objc private func seeMoreTapped() {
        isExpanded.toggle()
        onToggleTapped?()
    }

    private func updateUI() {
        let text = isExpanded ? instructionText : String(instructionText.prefix(150))
        let attributedText = NSMutableAttributedString(string: text)

        if instructionText.count > 150 {
            let showMoreText = isExpanded ? Constants.showLess.rawValue : Constants.showMore.rawValue
            let showMoreAttributed = NSAttributedString(
                string: showMoreText,
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.blue]
            )
            attributedText.append(showMoreAttributed)
        }

        instructionLabel.attributedText = attributedText
    }
}

extension MealListTableViewCell {
    func configure(using meal: Meal, isExpanded: Bool) {
        nameLabel.text = meal.strMeal
        instructionText = meal.strInstructions
        self.isExpanded = isExpanded
        updateUI()
        if let thumbnailURL = URL(string: meal.strMealThumb) {
            thumbnailImageView.fetchAndSetImage(from: thumbnailURL)
        }
    }
}
