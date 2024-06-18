//
//  UIImageView+.swift
//  iTunesAPITableView
//
//  Created by Shivam Shishangia on 14/06/24.
//

import UIKit

extension UIImageView {
    func fetchAndSetImage(from url: URL) {
        APIHelper.shared.fetchImage(from: url) { image in
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
}
