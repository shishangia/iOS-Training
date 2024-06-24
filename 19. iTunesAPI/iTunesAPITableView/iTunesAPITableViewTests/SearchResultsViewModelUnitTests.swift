//
//  iTunesAPITableViewTests.swift
//  iTunesAPITableViewTests
//
//  Created by Shivam Shishangia on 14/06/24.
//

import XCTest
@testable import iTunesAPITableView

final class SearchResultsViewModelUnitTests: XCTestCase {

    private var searchResultsViewModel: SearchResultsViewModel?

    override func setUpWithError() throws {
        searchResultsViewModel = SearchResultsViewModel(apiHelper: MockAPIHelper.mockShared)
    }

    override func tearDownWithError() throws {
        searchResultsViewModel = nil
    }

    func testDataCount() {
        searchResultsViewModel?.fetchSearchDataForKey {
            XCTAssertEqual(self.searchResultsViewModel?.searchResultCount(), 3)
        }
    }

    func testDataForIndexPath() {
        searchResultsViewModel?.fetchSearchDataForKey {
            guard let searchItem = self.searchResultsViewModel?.getSearchItemAt(IndexPath(row: 0, section: 0)) else {
                XCTFail(Constants.Errors.testing_ItemNotFound.rawValue)
                return
            }
            let expectedSearchItem = SearchItem(
                artistName: "Taylor Swift",
                collectionPrice: 12.99,
                country: "USA",
                primaryGenreName: "Pop",
                artworkUrl100: "https://example.com/taylor_swift.jpg"
            )
            XCTAssertEqual(searchItem.artistName, expectedSearchItem.artistName)
            XCTAssertEqual(searchItem.collectionPrice, expectedSearchItem.collectionPrice)
            XCTAssertEqual(searchItem.country, expectedSearchItem.country)
            XCTAssertEqual(searchItem.primaryGenreName, expectedSearchItem.primaryGenreName)
            XCTAssertEqual(searchItem.artworkUrl100, expectedSearchItem.artworkUrl100)
        }
    }
}
