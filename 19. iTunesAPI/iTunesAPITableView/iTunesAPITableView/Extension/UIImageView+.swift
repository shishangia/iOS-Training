//
//  UIImageView+.swift
//  iTunesAPITableView
//
//  Created by Shivam Shishangia on 14/06/24.
//

import UIKit

extension UIImageView {
    func fetchAndSetImage(from url: URL) {
        ImageDownloader.shared.fetchImage(from: url) { result in
            switch result {
            case .success(let image):
                DispatchQueue.main.async {
                    self.image = image
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
