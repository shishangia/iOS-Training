//
//  Constants.swift
//  APIJSONParsingTabViewController
//
//  Created by Shivam Shishangia on 18/06/24.
//

import Foundation

enum Constants: String {
    case userListViewControllerTitle = "User List"
    case showMore = "... show more"
    case showLess = " show less"

    enum APIURL: String {
        case usersAPI = "https://jsonplaceholder.typicode.com/users"
        case peopleAPI = "https://swapi.py4e.com/api/people/1"
        case videoAPI = "https://gist.githubusercontent.com/dbackeus/484315/raw/dfeb530f9619bb74af5d537280a0b3b305410d01/videos.json"
        case newsFeedAPI = "https://gist.githubusercontent.com/congsun/600f3ad57298f9dbc23fedf6b2b25450/raw/73d7a8ed589652339ae3646d0a595298ce5e72c2/newsFeed.json"
        case recipeAPI = "https://www.themealdb.com/api/json/v1/1/search.php?f=s"
    }

    enum ReuseIdentifiers: String {
        case userListTable = "UserListTableViewCell"
        case transcodingsListTable = "TranscodingTableViewCell"
        case newsFeedTable = "NewsFeedTableViewCell"
        case mealTable = "MealListTableViewCell"
    }

    enum Errors: String {
        case invalidURLError = "Invalid URL"
        case fetchDataError = "Could not fetch data: "
        case error = "Error: "
        case cellDequeueError = "Could not dequeue cell"
        case fetchImageError = "Failed to fetch image: "
    }

    enum LabelPrefix: String {
        case name = "Name: "
        case height = "Height: "
        case birthYear = "Birth Year: "
        case gender = "Gender: "
        case created = "Created on: "
        case id = "ID: "
        case title = "Title: "
    }
}
