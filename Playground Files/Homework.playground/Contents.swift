import Cocoa

func checkPalindrome(_ inputString: String) -> Bool {
    let lowercasedInput = inputString.lowercased()
    var leftIndex = lowercasedInput.startIndex
    var rightIndex = lowercasedInput.index(before: lowercasedInput.endIndex)

    while leftIndex < rightIndex {
        while leftIndex < rightIndex && !lowercasedInput[leftIndex].isLetter {
            leftIndex = lowercasedInput.index(after: leftIndex)
        }
        while rightIndex > leftIndex && !lowercasedInput[rightIndex].isLetter {
            rightIndex = lowercasedInput.index(before: rightIndex)
        }

        if lowercasedInput[leftIndex] != lowercasedInput[rightIndex] {
            return false
        }
        
        leftIndex = lowercasedInput.index(after: leftIndex)
        rightIndex = lowercasedInput.index(before: rightIndex)
    }
    return true
}

func countOccurance(_ inputString: String) -> [Character: Int] {
    var characterCounts: [Character: Int] = [:]
    
    let lowercasedInput = inputString.lowercased()
    
    for char in lowercasedInput {
        if !char.isLetter {
            continue
        }
        characterCounts[char, default: 0] += 1
    }
    
    return characterCounts
}

func mostReccuringChar(_ inputString: String) -> Character? {
    let characterCounts = countOccurance(inputString)

    var mostRecurringCharacter: Character? = nil
    var highestCount = 0
    for (char, count) in characterCounts {
        if count > highestCount {
            mostRecurringCharacter = char
            highestCount = count
        }
    }
    return mostRecurringCharacter
}

func removeDuplicateChar(_ inputString: String) -> String {
    var characterSet: Set<Character> = []
    let result = inputString.filter { characterSet.insert($0).inserted }
    return String(result)
}

func getDuplicateChar(_ inputString: String) -> String {
    let characterCounts = countOccurance(inputString)
    var result = ""
    
    for (char, count) in characterCounts {
        if count > 1 {
            result.append(char)
        }
    }
    return result
}

func firstNonRepeatingChar(_ inputString: String) -> Character? {
    let characterCounts = countOccurance(inputString)

    for (char, count) in characterCounts {
        if count == 1 {
            return char
        }
    }

    return nil
}

func removeChar(_ inputString1: String, _ inputString2: String) -> String {
    let charsToRemove = Set(inputString2)
    let result = inputString1.filter { !charsToRemove.contains($0) }
    return String(result)
}

func checkRotations(_ inputString1: String, _ inputString2: String) -> Bool {
    return inputString1.count == inputString2.count && (inputString1 + inputString1).contains(inputString2)
}

func reverseWords(_ inputString: String) -> String {
    return inputString.split(separator: " ").map { String($0.reversed()) }.joined(separator: " ")
}

let input = "Malayalam!"
let input2 = "ma"
print(checkPalindrome(input))

print(countOccurance(input))

print(mostReccuringChar(input) ?? "None")

print(removeDuplicateChar(input))

print(getDuplicateChar(input))

print(firstNonRepeatingChar(input) ?? "None")

print(removeChar(input, input2))

print(checkRotations("abcd", "bcda"))

print(reverseWords("Android is best"))
