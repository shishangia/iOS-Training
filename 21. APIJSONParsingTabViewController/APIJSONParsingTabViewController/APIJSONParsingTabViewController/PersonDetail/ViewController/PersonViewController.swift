//
//  PersonViewController.swift
//  APIJSONParsingTabViewController
//
//  Created by Shivam Shishangia on 19/06/24.
//

import UIKit

class PersonViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var birthYearLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var createdLabel: UILabel!

    let personViewModel = PersonViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchData()
    }
}

extension PersonViewController {
    private func setupUI(){
        stackView.isHidden = true
    }

    private func fetchData() {
        Task {
            await personViewModel.fetchPersonDetails()
            DispatchQueue.main.async {
                self.updateUI()
            }
        }
    }

    private func updateUI() {
        nameLabel.text = Constants.LabelPrefix.name.rawValue + (personViewModel.getPersonName() ?? "")
        heightLabel.text = Constants.LabelPrefix.height.rawValue + (personViewModel.getPersonHeight() ?? "")
        birthYearLabel.text = Constants.LabelPrefix.birthYear.rawValue + (personViewModel.getPersonBirthYear() ?? "")
        genderLabel.text = Constants.LabelPrefix.gender.rawValue + (personViewModel.getPersonGender() ?? "")
        createdLabel.text = Constants.LabelPrefix.created.rawValue + (personViewModel.getPersonCreated() ?? "")
        activityIndicator.stopAnimating()
        stackView.isHidden = false
    }
}
