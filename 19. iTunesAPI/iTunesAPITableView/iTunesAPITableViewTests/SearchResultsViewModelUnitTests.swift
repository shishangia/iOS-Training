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
        searchResultsViewModel = SearchResultsViewModel()
    }

    override func tearDownWithError() throws {
        searchResultsViewModel = nil
    }

    func testDataCount() {
        mockData()
        XCTAssertEqual(searchResultsViewModel?.searchResultCount(), 3)
    }

    func testDataForIndexPath() {
        mockData()
        guard let searchItem = searchResultsViewModel?.getSearchItemAt(IndexPath(row: 0, section: 0)) else {
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

// MARK: Private Helper
extension SearchResultsViewModelUnitTests {
    private func mockData() {
        searchResultsViewModel?.mockSearchResults()
    }
}
