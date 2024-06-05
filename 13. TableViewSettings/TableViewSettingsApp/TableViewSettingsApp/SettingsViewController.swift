//
//  ViewController.swift
//  TableViewSettingsApp
//
//  Created by Shivam Shishangia on 04/06/24.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var settingsTableView: UITableView!

    var settingsSection: [SettingSection] = []

    lazy var defaultImage: UIImage? = {
        let imageConfig = UIImage.SymbolConfiguration(paletteColors: [.systemBackground])
        let image = UIImage(systemName: "gear", withConfiguration: imageConfig)
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        settingsSection = Mock.generateSettingSection()
    }

    private func setupUI() {
        self.navigationItem.title = "Settings"
        settingsTableView.backgroundColor = UIColor(red: (242/255.0), green:(242/255.0), blue:(247/255.0), alpha:1)
        settingsTableView.dataSource = self
        settingsTableView.delegate = self
    }
}

extension SettingsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return settingsSection.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsSection[section].settings.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsTableViewCell", for: indexPath) as? SettingsTableViewCell else {
            fatalError("Unable to dequeue cell")
        }
        let setting = settingsSection[indexPath.section].settings[indexPath.row]
        cell.title.text = setting.name
        cell.logo.layer.cornerRadius = 5
        cell.logo.backgroundColor = .gray
        cell.logo.image = setting.logo ?? defaultImage
        return cell
    }
}

extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 20))
    }
}
