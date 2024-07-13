//
//  APIHelperProtocol.swift
//  iTunesAPITableView
//
//  Created by Shivam Shishangia on 25/06/24.
//

import Foundation

// MARK: Protocol to fetch data from offline and network source
protocol APIHelperProtocol {
    func fetchData<T: Decodable>(apiURL: URL?, completion: @escaping (T?) -> Void)
}
