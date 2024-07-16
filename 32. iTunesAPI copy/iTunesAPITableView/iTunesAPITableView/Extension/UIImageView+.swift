//
//  UIImageView+.swift
//  iTunesAPITableView
//
//  Created by Shivam Shishangia on 14/06/24.
//

import UIKit

extension UIImageView {
    func fetchAndSetImage(from url: URL) {
        NetworkAPIHelper.shared.fetchImage(from: url) { image in
            DispatchQueue.main.async {
                if let image = image {
                    self.image = image
                }
            }
        }
    }
}
