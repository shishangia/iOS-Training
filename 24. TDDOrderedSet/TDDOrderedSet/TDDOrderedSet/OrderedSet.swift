//
//  OrderedSet.swift
//  TDDOrderedSet
//
//  Created by Shivam Shishangia on 26/06/24.
//

import Foundation

class OrderedSet<T: Comparable> {
    private var setArray: [T] = []
}

extension OrderedSet {
    func isExists(item: T) -> Bool {
        return setArray.contains(item)
    }

    func add(item: T) {
        if !isExists(item: item) {
            setArray.append(item)
            setArray.sort()
        }
    }

    func getCount() -> Int {
        return setArray.count
    }

    func remove(at index: Int) {
        if index >= 0 && index < setArray.count {
            setArray.remove(at: index)
        }
    }

    func remove(item: T) {
        if let index = getIndex(item: item) {
            remove(at: index)
        }
    }

    func removeAll() {
        setArray.removeAll()
    }

    func getMax() -> T? {
        return setArray.max()
    }

    func getMin() -> T? {
        return setArray.min()
    }

    func addArray(array: [T]) {
        for item in array {
            add(item: item)
        }
    }

    func getIndex(item: T) -> Int? {
        return setArray.firstIndex(of: item)
    }

    func getArray() -> [T] {
        return setArray
    }

    func getSubArray(from startIndex: Int, to endIndex: Int) -> [T]? {
        if startIndex >= 0, endIndex < getCount(), startIndex <= endIndex {
            return Array(setArray[startIndex...endIndex])
        }
        return nil
    }

    func kthLargest(k: Int, before index: Int) -> T? {
        if let subArray = getSubArray(from: 0, to: index),
           k > 0 && k <= subArray.count {
            return subArray[k-1]
        }
        return nil
    }

    func kthSmallest(k: Int, before index: Int) -> T? {
        if let subArray = getSubArray(from: 0, to: index),
           k > 0 && k <= subArray.count {
            return subArray[subArray.count - k]
        }
        return nil
    }

    func kthLargest(k: Int, after index: Int) -> T? {
        if let subArray = getSubArray(from: index, to: getCount() - 1),
           k > 0 && k <= subArray.count {
            return subArray[k-1]
        }
        return nil
    }

    func kthSmallest(k: Int, after index: Int) -> T? {
        if let subArray = getSubArray(from: index, to: getCount() - 1),
           k > 0 && k <= subArray.count {
            return subArray[subArray.count - k]
        }
        return nil
    }
}
