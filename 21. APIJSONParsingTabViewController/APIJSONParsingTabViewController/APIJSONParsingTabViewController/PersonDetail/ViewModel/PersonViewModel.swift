//
//  PersonViewModel.swift
//  APIJSONParsingTabViewController
//
//  Created by Shivam Shishangia on 19/06/24.
//

import Foundation

class PersonViewModel {
    private var personDetail: Person?
}

extension PersonViewModel {
    func getPersonName() -> String? {
        return personDetail?.name
    }

    func getPersonHeight() -> String? {
        return personDetail?.height
    }

    func getPersonBirthYear() -> String? {
        return personDetail?.birthYear
    }

    func getPersonGender() -> String? {
        return personDetail?.gender
    }

    func getPersonCreated() -> String? {
        return personDetail?.created.formatDate()
    }

    func fetchPersonDetails() async {
        guard let apiURL = URL(string: Constants.APIURL.peopleAPI.rawValue) else {
            fatalError(Constants.Errors.invalidURLError.rawValue)
        }
        do {
            if let personDetail: Person = try await APIHelper.shared.fetchData(apiURL: apiURL) {
                self.personDetail = personDetail
            }
        } catch {
            fatalError(Constants.Errors.fetchDataError.rawValue + error.localizedDescription)
        }
    }
}
