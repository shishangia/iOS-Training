import Foundation

let array = ["1","2","3","4", "abc"]

let output = array.compactMap { Int($0) }.filter { $0.isMultiple(of: 2) }.reduce(0) {$0 + $1}

print(output)


let numbers = Array(1...100)

let output2 = numbers.filter { $0 % 2 == 1}

print(output2)
