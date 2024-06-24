//
//  MealListViewModel.swift
//  APIJSONParsingTabViewController
//
//  Created by Shivam Shishangia on 20/06/24.
//

import Foundation

class MealListViewModel {
    private var mealResponse: MealResponse?
}

extension MealListViewModel {
    func mealCount() -> Int {
        return mealResponse?.meals.count ?? 0
    }
    
    func getMealAt(_ indexPath: IndexPath) -> Meal? {
        return mealResponse?.meals[indexPath.row]
    }

    func fetchMeals() async {
        guard let apiURL = URL(string: Constants.APIURL.recipeAPI.rawValue) else {
            fatalError(Constants.Errors.invalidURLError.rawValue)
        }

        do {
            if let mealResponse: MealResponse = try await APIHelper.shared.fetchData(apiURL: apiURL) {
                self.mealResponse = mealResponse
            }
        } catch {
            fatalError(Constants.Errors.fetchDataError.rawValue + error.localizedDescription)
        }
    }
}
