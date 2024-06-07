//
//  XCTests1Tests.swift
//  XCTests1Tests
//
//  Created by Shivam Shishangia on 06/06/24.
//

import XCTest
@testable import XCTests1

final class XCTests1Tests: XCTestCase {

    var testCalculator: Calculator?

    override func setUpWithError() throws {
        testCalculator = Calculator()
    }

    override func tearDownWithError() throws {
        testCalculator = nil
    }

    func testAddition() {
        XCTAssertEqual(testCalculator?.sum(1, 2), 3)
    }

    func testSubtraction() {
        XCTAssertEqual(testCalculator?.difference(1, 2), -1)
    }
    func testMultiplication() {
        XCTAssertEqual(testCalculator?.product(1, 2), 2)
    }
    func testDivision() {
        XCTAssertEqual(testCalculator?.division(2, 1), 2)
    }
}
