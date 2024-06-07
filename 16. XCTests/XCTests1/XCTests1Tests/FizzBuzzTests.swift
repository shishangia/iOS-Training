//
//  FizzBuzzTests.swift
//  XCTests1Tests
//
//  Created by Shivam Shishangia on 07/06/24.
//

import XCTest
@testable import XCTests1

class FizzBuzzTests: XCTestCase {

    var testFizzBuzz: FizzBuzz?

    override func setUpWithError() throws {
        testFizzBuzz = FizzBuzz()
    }

    override func tearDownWithError() throws {
        testFizzBuzz = nil
    }

    func testPrintFizzBuzzForNumber() {
        if let testFizzBuzz = testFizzBuzz {
            XCTAssertEqual(testFizzBuzz.printFizzBuzz(1), "1")
        }
    }

    func testPrintFizzBuzzForMultipleof3() {
        if let testFizzBuzz = testFizzBuzz {
            XCTAssertEqual(testFizzBuzz.printFizzBuzz(3), "Fizz")
        }
    }

    func testPrintFizzBuzzForMultipleof5() {
        if let testFizzBuzz = testFizzBuzz {
            XCTAssertEqual(testFizzBuzz.printFizzBuzz(5), "Buzz")
        }
    }

    func testPrintFizzBuzzForForMultipleof3And5() {
        if let testFizzBuzz = testFizzBuzz {
            XCTAssertEqual(testFizzBuzz.printFizzBuzz(15), "FizzBuzz")
        }
    }
}
