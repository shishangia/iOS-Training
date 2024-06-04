import Cocoa

func countOccurance(_ inputString: String) -> [Character: Int] {
    var characterCounts: [Character: Int] = [:]
    
    for char in inputString {
        if !char.isLetter {
            continue
        }
        characterCounts[char, default: 0] += 1
    }
    
    return characterCounts
}

print(countOccurance("INDIA"))
