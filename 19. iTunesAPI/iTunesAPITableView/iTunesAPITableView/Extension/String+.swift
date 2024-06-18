//
//  String+.swift
//  iTunesAPITableView
//
//  Created by Shivam Shishangia on 18/06/24.
//

import Foundation

extension String {
    func replacingSpacesWithPlus() -> String {
        return self.replacingOccurrences(of: " ", with: "+")
    }
}
