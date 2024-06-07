//
//  FizzBuzz.swift
//  XCTests1
//
//  Created by Shivam Shishangia on 07/06/24.
//

import Foundation

struct FizzBuzz {

    func printFizzBuzz(_ number: Int) -> String {
        if number.isMultiple(of: 3) && number.isMultiple(of: 5) {
            return "FizzBuzz"
        } else if number.isMultiple(of: 3) {
            return "Fizz"
        } else if number.isMultiple(of: 5) {
            return "Buzz"
        } else {
            return "\(number)"
        }
    }

}
