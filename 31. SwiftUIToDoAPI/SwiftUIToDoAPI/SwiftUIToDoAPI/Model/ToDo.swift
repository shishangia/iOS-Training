//
//  ToDo.swift
//  SwiftUIToDoAPI
//
//  Created by Shivam Shishangia on 09/07/24.
//

import Foundation

struct ToDo: Codable, Identifiable {
    var id: Int
    var title: String
    var completed: Bool
}
