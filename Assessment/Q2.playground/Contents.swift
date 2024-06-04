import Cocoa

func bubbleSort(_ inputArray: inout [Int]) {
    let n = inputArray.count
    for i in 0..<n-1 {
        for j in 0..<n-i-1 {
            if inputArray[j] > inputArray[j+1] {
                inputArray.swapAt(j, j+1)
            }
        }
    }
}

var input = [3,2,4,6,1,2,5,3]
bubbleSort(&input)
print(input)
