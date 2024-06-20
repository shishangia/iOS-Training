//
//  NewsFeedViewModel.swift
//  APIJSONParsingTabViewController
//
//  Created by Shivam Shishangia on 19/06/24.
//

import Foundation

class NewsFeedViewModel {
    private var newsFeed: NewsFeed?
}

extension NewsFeedViewModel {
    func newsFeedCount() -> Int {
        return newsFeed?.articles.count ?? 0
    }
    
    func getArticleAt(_ indexPath: IndexPath) -> Article? {
        return newsFeed?.articles[indexPath.row]
    }

    func fetchNews() async {
        guard let apiURL = URL(string: Constants.APIURL.newsFeedAPI.rawValue) else {
            fatalError(Constants.Errors.invalidURLError.rawValue)
        }
        do {
            if let newsFeed: NewsFeed = try await APIHelper.shared.fetchData(apiURL: apiURL) {
                self.newsFeed = newsFeed
            }
        } catch {
            fatalError(Constants.Errors.fetchDataError.rawValue + error.localizedDescription)
        }
    }
}
