//
//  UIImageView+.swift
//  APIJSONParsingTabViewController
//
//  Created by Shivam Shishangia on 19/06/24.
//

import UIKit

extension UIImageView {
    func fetchAndSetImage(from url: URL) async {
        do {
            if let image = try await APIHelper.shared.fetchImage(from: url) {
                DispatchQueue.main.async {
                    self.image = image
                }
            }
        } catch {
            print(Constants.Errors.fetchImageError.rawValue + error.localizedDescription)
        }
    }
}
