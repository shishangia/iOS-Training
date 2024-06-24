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

    
    func fetchUserDetails() async {
        guard let apiURL = URL(string: Constants.APIURL.usersAPI.rawValue) else {
            fatalError(Constants.Errors.invalidURLError.rawValue)
        }
        
        do {
            if let userDetails: [UserDetail] = try await APIHelper.shared.fetchData(apiURL: apiURL) {
                self.userDetails = userDetails
            }
        } catch {
            print("Failed to fetch user details: \(error)")
        }
    }
}
