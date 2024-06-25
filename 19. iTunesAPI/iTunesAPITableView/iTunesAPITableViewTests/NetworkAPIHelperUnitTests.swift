//
//  NetworkAPIHelperUnitTests.swift
//  iTunesAPITableViewTests
//
//  Created by Shivam Shishangia on 25/06/24.
//

import XCTest
@testable import iTunesAPITableView

final class NetworkAPIHelperUnitTests: XCTestCase {
    
    private var apiHelper: NetworkAPIHelper?

    override func setUpWithError() throws {
        super.setUp()
        apiHelper = NetworkAPIHelper.shared
    }

    override func tearDownWithError() throws {
        apiHelper = nil
        super.tearDown()
    }

    func testFetchData() {
        apiHelper?.fetchData(apiURL: nil, completion: { (data: SearchResult?) in
            XCTAssertNil(data)
        })
    }

    func testParsing() {
        apiHelper?.parseResponse(for: Data(), completion: { (parsedValue: SearchResult?) in
            XCTAssertNil(parsedValue)
        })
    }
}
