//
//  OrderedSetUnitTests.swift
//  TDDOrderedSetTests
//
//  Created by Shivam Shishangia on 26/06/24.
//

import XCTest
@testable import TDDOrderedSet

final class OrderedSetUnitTests: XCTestCase {

    var orderedSet: OrderedSet<Int>!

    override func setUpWithError() throws {
        super.setUp()
        orderedSet = OrderedSet<Int>()
    }

    override func tearDownWithError() throws {
        orderedSet = nil
        super.tearDown()
    }

    func testExists() throws {
        orderedSet.add(item: 1)
        XCTAssertTrue(orderedSet.isExists(item: 1))
        XCTAssertFalse(orderedSet.isExists(item: 2))
    }

    func testAdd() throws {
        XCTAssertFalse(orderedSet.isExists(item: 1))
        orderedSet.add(item: 1)
        XCTAssertTrue(orderedSet.isExists(item: 1))
    }
    
    func testEmptyCount() throws {
        XCTAssertEqual(orderedSet.getCount(), 0)
    }

    func testCount() throws {
        orderedSet.add(item: 1)
        XCTAssertEqual(orderedSet.getCount(), 1)
    }

    func testDuplicateAddition() throws {
        orderedSet.add(item: 1)
        XCTAssertTrue(orderedSet.isExists(item: 1))
        XCTAssertEqual(orderedSet.getCount(), 1)
        orderedSet.add(item: 1)
        XCTAssertTrue(orderedSet.isExists(item: 1))
        XCTAssertEqual(orderedSet.getCount(), 1)
    }

    func testRemoveAtIndex() throws {
        orderedSet.add(item: 1)
        orderedSet.add(item: 2)
        orderedSet.remove(at: 0)
        XCTAssertFalse(orderedSet.isExists(item: 1))
        XCTAssertEqual(orderedSet.getCount(), 1)
    }

    func testRemoveAtInvalidIndex() throws {
        orderedSet.add(item: 1)
        orderedSet.remove(at: 1)
        XCTAssertTrue(orderedSet.isExists(item: 1))
        XCTAssertEqual(orderedSet.getCount(), 1)
    }

    func testRemoveItem() throws {
        orderedSet.add(item: 2)
        orderedSet.add(item: 1)
        orderedSet.remove(item: 1)
        XCTAssertTrue(orderedSet.isExists(item: 2))
        XCTAssertEqual(orderedSet.getCount(), 1)
    }

    func testRemoveInvalidItem() throws {
        orderedSet.add(item: 1)
        orderedSet.add(item: 2)
        orderedSet.remove(item: 3)
        XCTAssertTrue(orderedSet.isExists(item: 1))
        XCTAssertTrue(orderedSet.isExists(item: 2))
        XCTAssertEqual(orderedSet.getCount(), 2)
    }

    func testRemoveAll() throws {
        orderedSet.add(item: 1)
        orderedSet.add(item: 2)
        orderedSet.removeAll()
        XCTAssertEqual(orderedSet.getCount(), 0)
    }

    func testMax() throws {
        XCTAssertNil(orderedSet.getMax())
        orderedSet.add(item: 1)
        orderedSet.add(item: 2)
        XCTAssertEqual(orderedSet.getMax(), 2)
    }

    func testMin() throws {
        XCTAssertNil(orderedSet.getMin())
        orderedSet.add(item: 1)
        orderedSet.add(item: 2)
        XCTAssertEqual(orderedSet.getMin(), 1)
    }

    func testAddArray() throws {
        orderedSet.addArray(array: [1, 2, 3, 4, 3, 5])
        XCTAssertEqual(orderedSet.getCount(), 5)
        XCTAssertTrue(orderedSet.isExists(item: 2))
    }
    
    func testGetIndex() throws {
        orderedSet.add(item: 1)
        XCTAssertEqual(orderedSet.getIndex(item: 1), 0)
        XCTAssertNil(orderedSet.getIndex(item: 2))
    }

    func testGetArray() throws {
        XCTAssertEqual(orderedSet.getArray(), [])
        orderedSet.addArray(array: [1, 2, 3, 4, 3, 5])
        XCTAssertEqual(orderedSet.getArray(), [1, 2, 3, 4, 5])
    }

    func testGetSubArray() throws {
        orderedSet.addArray(array: [1, 2, 3, 4, 3, 5])
        XCTAssertEqual(orderedSet.getSubArray(from: 1, to: 3), [2, 3, 4])
        XCTAssertNil(orderedSet.getSubArray(from: 0, to: 8))
    }

    func testkthLargestBefore() throws {
        orderedSet.addArray(array: [1, 2, 3, 4, 5])
        XCTAssertEqual(orderedSet.kthLargest(k: 3, before: 3), 3)
        XCTAssertNil(orderedSet.kthLargest(k: 3, before: 1))
    }

    func testkthSmallestBefore() throws {
        orderedSet.addArray(array: [1, 2, 3, 4, 5])
        XCTAssertEqual(orderedSet.kthSmallest(k: 3, before: 3), 2)
        XCTAssertNil(orderedSet.kthSmallest(k: 3, before: 1))
    }

    func testkthLargestAfter() throws {
        orderedSet.addArray(array: [1, 2, 3, 4, 5])
        XCTAssertEqual(orderedSet.kthLargest(k: 3, after: 1), 4)
        XCTAssertNil(orderedSet.kthLargest(k: 3, after: 3))
    }

    func testkthSmallestAfter() throws {
        orderedSet.addArray(array: [1, 2, 3, 4, 5])
        XCTAssertEqual(orderedSet.kthSmallest(k: 3, after: 1), 3)
        XCTAssertNil(orderedSet.kthSmallest(k: 3, after: 3))
    }
}
