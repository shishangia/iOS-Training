import Foundation

let strs = ["flower","flow","flight"]

if let first = strs.first {
    var commonPrefix = first
    
    for str in strs {
        let temp = str.commonPrefix(with: first)
        if temp.count < commonPrefix.count {
            commonPrefix = temp
        }
    }
    
    print(commonPrefix)
}
