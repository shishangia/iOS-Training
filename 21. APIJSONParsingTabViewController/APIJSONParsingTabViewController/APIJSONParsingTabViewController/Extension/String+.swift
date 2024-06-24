//
//  String+.swift
//  APIJSONParsingTabViewController
//
//  Created by Shivam Shishangia on 19/06/24.
//

import Foundation

extension String {
    func formatDate(dateFormat: String = "dd-MM-yyyy") -> String? {
        let dateFormats = [
        "yyyy-MM-dd'T'HH:mm:ssZ",
        "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        ]
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        
        for format in dateFormats {
            dateFormatter.dateFormat = format
            if let date = dateFormatter.date(from: self) {
                dateFormatter.dateFormat = dateFormat
                return dateFormatter.string(from: date)
            }
        }
        return nil
    }
}
