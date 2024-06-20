//
//  UserListViewModel.swift
//  APIJSONParsingTabViewController
//
//  Created by Shivam Shishangia on 18/06/24.
//

import Foundation

class UserListViewModel {
    private var userDetails: [UserDetail] = []
}

extension UserListViewModel {
    func userDetailCount() -> Int {
        return userDetails.count
    }
    
    func getuserDetailAt(_ indexPath: IndexPath) -> UserDetail {
        return userDetails[indexPath.row]
    }
    
    func fetchUserDetails(completion: @escaping () -> Void) {
        guard let apiURL = URL(string: Constants.APIURL.usersAPI.rawValue) else {
            fatalError(Constants.Errors.invalidURLError.rawValue)
        }
        
        APIHelper.shared.fetchData(apiURL: apiURL) { [weak self] (userDetails: [UserDetail]?) in
            if let userDetails = userDetails {
                self?.userDetails = userDetails
                completion()
            }
        }
    }
}
