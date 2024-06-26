//
//  Constant.swift
//  HitsNewsAPIData
//
//  Created by Shivam Shishangia on 25/06/24.
//

import Foundation

enum Constants: String {
    case APIURL = "https://hn.algolia.com/api/v1/search?tags=front_page"
    case TableViewDequeIdentifier = "NewsListTableViewCell"
    case WebKitViewControllerIdentifier = "WebKitViewController"
    case StoryboardName = "Main"

    enum Errors: String {
        case InvalidURLError = "Invalid URL String"
        case DataFetchError = "Cannot fetch data"
        case CellDequeueError = "Cannot dequeue desired cell"
    }
}
