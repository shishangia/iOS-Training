//
//  NewsListViewModel.swift
//  HitsNewsAPIData
//
//  Created by Shivam Shishangia on 25/06/24.
//

import Foundation

class NewsListViewModel {
    private var newsData: News?
}

extension NewsListViewModel {
    func getNewsDataCount() -> Int {
        return newsData?.hits.count ?? 0
    }

    func getHit(for indexPath: IndexPath) -> Hit? {
        guard indexPath.row <= getNewsDataCount() else {
            return nil
        }
        return newsData?.hits[indexPath.row]
    }

    func fetchNewsData() async {
        do {
            if let newsData: News = try await APIHelper.shared.fetchData(urlString: Constants.APIURL.rawValue) {
                self.newsData = newsData
            }
        } catch {
            print(Constants.Errors.DataFetchError.rawValue)
        }
    }
}
