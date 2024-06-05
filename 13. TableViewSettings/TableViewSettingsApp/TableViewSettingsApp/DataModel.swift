//
//  DataModel.swift
//  TableViewSettingsApp
//
//  Created by Shivam Shishangia on 04/06/24.
//

import UIKit

struct SettingSection {
    var settings: [Setting]
}
struct Setting {
    var name: String
    var logo: UIImage?
}

class Mock {
    static func generateSettingSection() -> [SettingSection] {
        return [
            SettingSection(settings: [
                Setting(name: "Screen Time"),
                Setting(name: "Action Button")
            ]),
            SettingSection(settings: [
                Setting(name: "General"),
                Setting(name: "Accessibility"),
                Setting(name: "Privacy and Security")
            ])
        ]
    }
}
