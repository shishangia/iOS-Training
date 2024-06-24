//
//  VideoViewModel.swift
//  APIJSONParsingTabViewController
//
//  Created by Shivam Shishangia on 19/06/24.
//

import Foundation

class VideoViewModel {
    private var videoList: [Video] = []
}

extension VideoViewModel {

    func getTranscodingsCount() -> Int {
        return videoList.first?.transcodings.count ?? 0
    }

    func getTranscodingAt(_ indexPath: IndexPath) -> Transcoding? {
        return videoList.first?.transcodings[indexPath.row]
    }

    func getVideoTitle() -> String? {
        return videoList.first?.title
    }

    func getVideoCreated() -> String? {
        return videoList.first?.createdAt.formatDate()
    }

    func fetchVideo() async {
        guard let apiURL = URL(string: Constants.APIURL.videoAPI.rawValue) else {
            fatalError(Constants.Errors.invalidURLError.rawValue)
        }
        do {
            if let videoList: [Video] = try await APIHelper.shared.fetchData(apiURL: apiURL) {
                self.videoList = videoList
            }
        } catch {
            fatalError(Constants.Errors.fetchDataError.rawValue + error.localizedDescription)
        }
    }
}
