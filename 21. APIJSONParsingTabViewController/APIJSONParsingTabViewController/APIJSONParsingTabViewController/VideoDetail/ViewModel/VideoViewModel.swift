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

    func fetchVideoDetail(completion: @escaping () -> Void) {
        guard let apiURL = URL(string: Constants.APIURL.videoAPI.rawValue) else {
            fatalError(Constants.Errors.invalidURLError.rawValue)
        }
        APIHelper.shared.fetchData(apiURL: apiURL) { [weak self] (videoList: [Video]?) in
            if let videoList = videoList {
                self?.videoList = videoList
                completion()
            }
        }
    }
}
