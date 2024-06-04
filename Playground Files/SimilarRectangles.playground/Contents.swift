import Cocoa

func normalize(_ a: Int, _ b: Int) -> (Int, Int) {
    return a < b ? (a, b) : (b, a)
}

func solution(_ A: inout [Int], _ B: inout [Int]) -> Int {
    
    var countDict = [String: Int]()

    for i in 0..<A.count {
        let rect = normalize(A[i], B[i])
        let key = "\(rect.0),\(rect.1)"
        countDict[key, default: 0] += 1
    }
    
    var maxSimilar = 0
    
    for (key, freq) in countDict {
        let sides = key.split(separator: ",").map { Int($0)! }
        let w = sides[0]
        let h = sides[1]
        
        var maxCount = freq
        
        if w <= 500 {
            if let count = countDict["\(w),\(h + 1)"] {
                maxCount = max(maxCount, count + freq)
            }
            if h > 1, let count = countDict["\(w),\(h - 1)"] {
                maxCount = max(maxCount, count + freq)
            }
        }
        if h <= 500 {
            if let count = countDict["\(w + 1),\(h)"] {
                maxCount = max(maxCount, count + freq)
            }
            if w > 1, let count = countDict["\(w - 1),\(h)"] {
                maxCount = max(maxCount, count + freq)
            }
        }
        
        maxSimilar = max(maxSimilar, maxCount)
    }
    
    return maxSimilar
}


// Example usage:
var A1 = [500, 500]
var B1 = [500, 500]
print(solution(&A1, &B1))  // Output: 2

var A2 = [5, 5, 1, 6, 4]
var B2 = [2, 1, 6, 1, 1]
print(solution(&A2, &B2))  // Output: 3

var A3 = [3, 3, 3, 3, 5, 7, 1, 1]
var B3 = [4, 6, 8, 10, 10, 10, 2, 3]
print(solution(&A3, &B3))  // Output: 2

var A4 = [4, 4, 2, 2, 2, 4, 4]
var B4 = [3, 4, 6, 6, 6, 3, 4]
print(solution(&A4, &B4))  // Output: 4
