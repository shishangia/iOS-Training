//
//  VideoDetailViewController+UITableViewDataSource.swift
//  APIJSONParsingTabViewController
//
//  Created by Shivam Shishangia on 19/06/24.
//

import UIKit

extension VideoDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoViewModel.getTranscodingsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.ReuseIdentifiers.transcodingsListTable.rawValue,
                                                       for: indexPath) as? TranscodingTableViewCell else {
            fatalError(Constants.Errors.cellDequeueError.rawValue)
        }
        if let transcoding = videoViewModel.getTranscodingAt(indexPath) {
            cell.configure(using: transcoding)
        }
        return cell
    }
}
